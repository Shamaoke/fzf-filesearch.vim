vim9script
##
# ::: Fzf Filesearch :::
#

import './fzf-options.vim' as Fzf

def FzfPluginSource(): list<string>
  return split(system('rg --color ansi --line-number .'), "\n")
enddef

def FzfPluginSink(entry: list<string>): void
  var [key, value] = entry

  var [path, line; _] = split(value, ':')

  if key == 'enter'
    execute $"edit +{line} {path}"
  elseif key == 'ctrl-t'
    execute $"tabedit +{line} {path}"
  elseif key == 'ctrl-s'
    execute $"split +{line} {path}"
  elseif key == 'ctrl-v'
    execute $"vsplit +{line} {path}"
  endif
enddef

export def FzfPluginRun(): void
  var fzf_plugin_options = {
    'source': FzfPluginSource(),
    'sink*': FzfPluginSink
  }

  var fzf_spec = extendnew(fzf_plugin_options, Fzf.options)

  fzf#run(fzf_spec)
enddef

