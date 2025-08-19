# AQL Syntax Highlighting for Vim/Neovim

A comprehensive syntax highlighting plugin for ArangoDB AQL (ArangoDB Query Language) in Vim and Neovim editors.

## Installation

### Manual Installation

1. Clone this repository:
```bash
git clone https://github.com/jbajic/aql-syntax-vim.git
```

2. Copy the files to your Vim configuration:
```bash
# For Vim
cp -r aql-syntax-vim/ftdetect ~/.vim/
cp -r aql-syntax-vim/syntax ~/.vim/
```

### Using a Plugin Manager

#### Packer (Neovim)
```lua
use 'jbajic/aql-syntax-vim'
```

#### Vim-Plug
```vim
Plug 'jbajic/aql-syntax-vim'
```

#### Vundle
```vim
Plugin 'jbajic/aql-syntax-vim'
```

#### Pathogen
```bash
git clone https://github.com/jbajic/aql-syntax-vim.git ~/.vim/bundle/aql-syntax-vim
```

## Usage

Once installed, the plugin will automatically detect `.aql` files and apply syntax highlighting. You can also manually set the filetype:

```vim
:set filetype=aql
```

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Related Links

- [ArangoDB Documentation](https://www.arangodb.com/docs/)
- [AQL Language Reference](https://www.arangodb.com/docs/stable/aql/)
