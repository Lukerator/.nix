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
			action.__raw = "function()
				Snacks.picker.pick({
					source = 'scratch',
					items = Snacks.scratch.list(),
					format = 'text',
					layout = {
						layout = { title = ' Select Scratch Buffer: ' },
						preview = true,
						preset = function()
							return vim.o.columns >= 120 and 'default' or 'vertical'
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
								['<c-x>'] = { 'delete', mode = { 'i', 'n' } },
							},
						},
					},
				})
			end";
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
