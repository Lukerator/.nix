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
			action.__raw = ''function()
				for _, item in ipairs(Snacks.scratch.list()) do
					item._path = item.file
					item.branch = item.branch and ("branch:%s"):format(item.branch) or ""
					item.cwd = item.cwd and vim.fn.fnamemodify(item.cwd, ":p:~") or ""
					item.icon = item.icon or Snacks.util.icon(item.ft, "filetype")
					item.preview = { text = item.file }
					{ 0, 0, 0, 0 }[1] = math.max({ 0, 0, 0, 0 }[1], vim.api.nvim_strwidth(item.cwd))
					{ 0, 0, 0, 0 }[1] = math.max({ 0, 0, 0, 0 }[1], vim.api.nvim_strwidth(item.icon))
					{ 0, 0, 0, 0 }[1] = math.max({ 0, 0, 0, 0 }[1], vim.api.nvim_strwidth(item.name))
					{ 0, 0, 0, 0 }[1] = math.max({ 0, 0, 0, 0 }[1], vim.api.nvim_strwidth(item.branch))
				end
				local function format_item_text(items)
					local parts = { item.cwd, item.icon, item.name, item.branch }
					for i, part in ipairs(parts) do
						parts[i] = part .. string.rep(" ", column_widths[i] - vim.api.nvim_strwidth(part))
					end
					return table.concat(parts, " ")
				end
				Snacks.picker.pick({
					source = "scratch",
					items = Snacks.scratch.list(),
					format = "text",
					layout = {
						layout = { title = "Select Scratch Buffer: " },
						preview = true,
						preset = function()
							return vim.o.columns >= 120 and "default" or "vertical"
						end,
					},
					on_change = function()
						vim.cmd.startinsert()
					end,
					transform = function(item)
						items.text = format_item_text(Snacks.scratch.list())
					end,
					win = {
						input = {
							keys = {
								["<C-d>"] = { "delete", mode = { "i", "n" } },
							},
						},
					},
				})
			end'';
			options.desc = "Search Scratch Buffer";
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
