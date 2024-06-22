return {
    'Xuyuanp/nerdtree-git-plugin',
    dependencies = {
        'preservim/nerdtree',
        'ryanoasis/vim-devicons',
    },
    priority = 101,
    config = function()
        vim.g.NERDTreeGitStatusIndicatorMapCustom = {
            Modified = '',
            Staged = '',
            Untracked = '',
            Renamed = '',
            Unmerged = '',
            Deleted = '',
            Dirty = '',
            Ignored = '',
            Clean = '',
            Unknown = '',
        }
    end
}
