vim9script
##
# ::: Fzf Options :::
#

export const options = {
  'window': {
    'width':  0.8,
    'height': 0.9,
    'border': 'sharp'
  },
  'options': [
    '--prompt=grep > ',
    '--no-multi',
    '--delimiter=:',
    '--preview-window=sharp:+{2}-/2',
    '--preview=bat --color=always --style=numbers --highlight-line={2} {1}',
    '--expect=enter,ctrl-t,ctrl-s,ctrl-v',
    '--ansi'
  ]
}

