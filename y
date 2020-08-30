#!/usr/bin/env python3

'''

Features:
- select 1080p, 720p, 480p, etc. easily
- live mode: display input after a download

'''

import argparse
import subprocess

heights  = ['2160', '1440', '1080', '720', '480', '360', '240', '144']

formats = {h: 'bestvideo[height<={0}]+bestaudio/best[height<={0}]'.format(h) for h in heights}
formats['best'] = 'best'


def get_parser():
    parser = argparse.ArgumentParser(description='Small shortcuts for youtube-dl', add_help=False)

    parser.add_argument('-h', '--help', action='store_true', help='Print this help text and exit')

    group = parser.add_argument_group('optional formats')
    ex_group = group.add_mutually_exclusive_group()

    for h in heights:
        ex_group.add_argument('--' + h, '--' + h + 'p', action='store_true')

    ex_group.add_argument('--best', action='store_true', help='Best format as single file')

    parser.add_argument('--live', action='store_true', help='Display input after each download')

    return parser


def main():
    parser = get_parser()
    args, other_args = parser.parse_known_args()
    args = vars(args)

    if args['help']:
       # print wrapper & youtube-dl help text 
       parser.print_help()
       print('\nyoutube-dl arguments:')
       subprocess.run(['youtube-dl', '-h'])
       return

    format = None
    for height in formats:
        if args[height]:
            format = height 

    full_args = ['youtube-dl'] + other_args

    if format:
        full_args += ['-f', formats[format]]

    if args['live']:
        while True:
            url = input('\nEnter url (q to exit): ')
            if url.lower() == 'q':
                return 
            subprocess.run(full_args + url.split()) 

    subprocess.run(full_args)


if __name__ == '__main__':
    main()