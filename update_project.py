#!/usr/bin/env python
import os
import json
import sys

def create_sublime_project(project_dir):
    project_file_dir = os.path.expanduser("~/sublime-projects")
    session_path = os.path.expanduser('~/.config/sublime-text-3/Local/Session.sublime_session')

    project_file_path = os.path.join(project_file_dir, project_dir + '.sublime-project')
    workspace_file_path = os.path.join(project_file_dir, project_dir + '.sublime-workspace')
    if not os.path.exists(project_file_path):
        project_obj = {
            'folders': [
                {
                    'follow_symlinks': True,
                    'path': project_dir
                }
            ]
        }
        project_file = open(project_file_path, 'w')
        project_file.write(json.dumps(project_obj, indent=2, separators=(',', ': ')))
        project_file.close()
    if not os.path.exists(workspace_file_path):
        workspace_file = open(workspace_file_path, 'w')
        workspace_file.write('{}')
        workspace_file.close()

    session_file = open(session_path, 'r')
    session_obj = json.loads(open(session_path).read(), strict=False)
    session_file.close()
    session_file = open(session_path, 'w')
    session_obj['workspaces']['recent_workspaces'] = [workspace_file_path]
    session_file.write(json.dumps(session_obj, indent=2, separators=(',', ': ')))
    session_file.close()

def main():
    if len(sys.argv) <= 1:
        print "First argument must be path where projects are located."
        return 1

    project_dir = os.path.expanduser(sys.argv[1])
    if not os.path.isdir(project_dir):
        print "Path is not valid."
        return 1

    create_sublime_projects(project_dir)
    return 0

# Must be run while sublime text is not running, otherwise it won't work
if __name__ == "__main__":
    sys.exit(main())