return {
	"mfussenegger/nvim-lint",
	event = { "BufWritePost", "BufReadPost", "InsertLeave" },
	config = function()
		local lint = require("lint")

		-- 🧠 Configure linters por tipo de arquivo
		lint.linters_by_ft = {
			-- go = { "golangci_lint" },
			lua = { "luacheck" },
			python = { "ruff" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			html = { "djlint" }, -- Requer 'djlint' instalado via pip
			css = { "stylelint" }, -- Requer 'stylelint'
			templ = { "djlint" }, -- Reaproveita 'djlint' para arquivos Templ
			fish = { "fish" },
			-- Fallbacks:
			["_"] = {},
			["*"] = {},
		}

		-- ✅ Debounce para evitar execuções repetidas
		local function debounce(ms, fn)
			local timer = vim.uv.new_timer()
			return function(...)
				local args = { ... }
				timer:start(ms, 0, function()
					timer:stop()
					vim.schedule_wrap(fn)(unpack(args))
				end)
			end
		end

		-- 🧪 Função principal de linting (inteligente)
		local function lint_current_buffer()
			local ft = vim.bo.filetype
			local filename = vim.api.nvim_buf_get_name(0)
			local ctx = { filename = filename, dirname = vim.fn.fnamemodify(filename, ":h") }

			local linters = lint._resolve_linter_by_ft(ft)
			vim.list_extend(linters, lint.linters_by_ft["_"] or {})
			vim.list_extend(linters, lint.linters_by_ft["*"] or {})

			linters = vim.tbl_filter(function(name)
				local linter = lint.linters[name]
				if not linter then
					vim.notify("Linter not found: " .. name, vim.log.levels.WARN)
					return false
				end
				if type(linter) == "table" and linter.condition and not linter.condition(ctx) then
					return false
				end
				return true
			end, linters)

			if #linters > 0 then
				lint.try_lint(linters)
			end
		end

		-- 🔁 Autoexecução nos eventos definidos
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("nvim-lint-auto", { clear = true }),
			callback = debounce(100, lint_current_buffer),
		})
	end,
}
