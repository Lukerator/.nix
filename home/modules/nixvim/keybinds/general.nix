{
	programs.nixvim.keymaps = [
		{
			key = "<up>";
			action = "gk";
			mode = [ "n" "v" ];
		}
		{
			action = "gj";
			key = "<down>";
			mode = [ "n" "v" ];
		}
		{
			key = "<leader>e";
			mode = [ "n" "v" ];
			action.__raw = "vim.diagnostic.open_float";
		}
		{
			key = "<leader>sb";
			mode = [ "n" "v" ];
			options.desc = "Search Scratch Buffer";
			action.__raw = ''
				local M = {}

				local column_widths = { 0, 0, 0, 0 }

				local function update_column_widths(item)
					column_widths[1] = math.max(column_widths[1], vim.api.nvim_strwidth(item.cwd))
					column_widths[2] = math.max(column_widths[2], vim.api.nvim_strwidth(item.icon))
					column_widths[3] = math.max(column_widths[3], vim.api.nvim_strwidth(item.name))
					column_widths[4] = math.max(column_widths[4], vim.api.nvim_strwidth(item.branch))
				end

				local function process_item(item)
					item._path = item.file
                                        item.branch = item.branch and ("branch:&space;"):format(item.branch) or ""
					item.cwd = item.cwd and vim.fn.fnamemodify(item.cwd, ":p:~") or ""
					item.icon = item.icon or Snacks.util.icon(item.ft, "filetype")
					item.preview = { text = item.file }
					update_column_widths(item)
				end

				function M.select_scratch() 
					local items = Snacks.scratch.list()
					process_items(items)

					Snacks.picker.pick({
						source = "scratch",
						items = items,
						format = "text",
						layout = {
							layout = { title = "Select scratch Buffer"},
							preview = true,
							preset = function()
								return vim.o.columns > 120 and "float" or "vertical"
							end,
						},
						on_change = function()
							vim.cmd.startinsert()
						end,
						transform = function(item)
							item.text = format_item_text(item)
						end,
						win = {
							input = {
								keys = {
									["<C-d>"] = { "delete", mode = { "i", "n" } },
								},
							},
						},
						actions = {
							default = function(picker, item)
								for _, entry in ipairs(items) do
									if entry.cwd == item.cwd then
										os.remove(item.file)
									end
								end
								picker:close()
								M.select_scratch()
							end,
						},
						confirm = function(_, item)
							if item then
								Snacks.scratch.open({ icon = item.icon, file = item.file, name = item.name, ft = item.ft })
							end
						end,
					})
				end

				return M
			'';
		}
		{
			key = "<leader>b";
			mode = [ "n" "v" ];
			options.desc = "Toggle Scratch Buffer";
			action.__raw = "function() Snacks.scratch() end";
		}
		/* {
			key = "<C-n>";
			mode = [ "n" "v" ];
			action = "<cmd>Oil --float %:p:h<CR>";
		} */
	];
}
