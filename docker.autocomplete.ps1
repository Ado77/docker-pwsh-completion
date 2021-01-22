using namespace System.Management.Automation
using namespace System.Management.Automation.Language

$script:dockerCommandTabComplete = {
    param($wordToComplete, $commandAst, $cursorPosition)

    $baseCommand = $commandAst.CommandElements[0]
    $commandElements = $commandAst.CommandElements
    $command = @(
        $baseCommand
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-')) {
                break
            }
            $element.Value
        }) -join ';'
    # attach build commit cp create diff events exec export history images import info inspect kill load login logout logs pause port ps pull push rename restart rm rmi run save search start stats stop tag top unpause update version wait
    $completions = @(switch ($command) {
            "$baseCommand" {
                [CompletionResult]::new('attach', 'attach', [CompletionResultType]::ParameterName, 'Attach local standard input, output, and error streams to a running container')
                [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterName, 'Build an image from a Dockerfile')
                [CompletionResult]::new('commit', 'commit', [CompletionResultType]::ParameterName, 'Create a new image from a containers changes')
                [CompletionResult]::new('cp', 'cp', [CompletionResultType]::ParameterName, 'Copy files/folders between a container and the local filesystem')
                [CompletionResult]::new('create', 'create', [CompletionResultType]::ParameterName, 'Create a new container')
                [CompletionResult]::new('diff', 'diff', [CompletionResultType]::ParameterName, 'Inspect changes to files or directories on a containers filesystem')
                [CompletionResult]::new('events', 'events', [CompletionResultType]::ParameterName, 'Get real time events from the server')
                [CompletionResult]::new('exec', 'exec', [CompletionResultType]::ParameterName, 'Run a command in a running container')
                [CompletionResult]::new('export', 'export', [CompletionResultType]::ParameterName, 'Export a containers filesystem as a tar archive')
                [CompletionResult]::new('history', 'history', [CompletionResultType]::ParameterName, 'Show the history of an image')
                [CompletionResult]::new('images', 'images', [CompletionResultType]::ParameterName, 'List images')
                [CompletionResult]::new('import', 'import', [CompletionResultType]::ParameterName, 'Import the contents from a tarball to create a filesystem image')
                [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterName, 'Display system-wide information')
                [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterName, 'Return low-level information on Docker objects')
                [CompletionResult]::new('kill', 'kill', [CompletionResultType]::ParameterName, 'Kill one or more running containers')
                [CompletionResult]::new('load', 'load', [CompletionResultType]::ParameterName, 'Load an image from a tar archive or STDIN')
                [CompletionResult]::new('login', 'login', [CompletionResultType]::ParameterName, 'Log in to a Docker registry')
                [CompletionResult]::new('logout', 'logout', [CompletionResultType]::ParameterName, 'Log out from a Docker registry')
                [CompletionResult]::new('logs', 'logs', [CompletionResultType]::ParameterName, 'Fetch the logs of a container')
                [CompletionResult]::new('pause', 'pause', [CompletionResultType]::ParameterName, 'Pause all processes within one or more containers')
                [CompletionResult]::new('port', 'port', [CompletionResultType]::ParameterName, 'List port mappings or a specific mapping for the container')
                [CompletionResult]::new('ps', 'ps', [CompletionResultType]::ParameterName, 'List containers')
                [CompletionResult]::new('pull', 'pull', [CompletionResultType]::ParameterName, 'Pull an image or a repository from a registry')
                [CompletionResult]::new('push', 'push', [CompletionResultType]::ParameterName, 'Push an image or a repository to a registry')
                [CompletionResult]::new('rename', 'rename', [CompletionResultType]::ParameterName, 'Rename a container')
                [CompletionResult]::new('restart', 'restart', [CompletionResultType]::ParameterName, 'Restart one or more containers')
                [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterName, 'Remove one or more containers')
                [CompletionResult]::new('rmi', 'rmi', [CompletionResultType]::ParameterName, 'Remove one or more images')
                [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterName, 'Run a command in a new container')
                [CompletionResult]::new('save', 'save', [CompletionResultType]::ParameterName, 'Save one or more images to a tar archive (streamed to STDOUT by default)')
                [CompletionResult]::new('search', 'search', [CompletionResultType]::ParameterName, 'Search the Docker Hub for images')
                [CompletionResult]::new('start', 'start', [CompletionResultType]::ParameterName, 'Start one or more stopped containers')
                [CompletionResult]::new('stats', 'stats', [CompletionResultType]::ParameterName, 'Display a live stream of container(s) resource usage statistics')
                [CompletionResult]::new('stop', 'stop', [CompletionResultType]::ParameterName, 'Stop one or more running containers')
                [CompletionResult]::new('tag', 'tag', [CompletionResultType]::ParameterName, 'Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE')
                [CompletionResult]::new('top', 'top', [CompletionResultType]::ParameterName, 'Display the running processes of a container')
                [CompletionResult]::new('unpause', 'unpause', [CompletionResultType]::ParameterName, 'Unpause all processes within one or more containers')
                [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterName, 'Update configuration of one or more containers')
                [CompletionResult]::new('version', 'version', [CompletionResultType]::ParameterName, 'Show the Docker version information')
                [CompletionResult]::new('wait', 'wait', [CompletionResultType]::ParameterName, 'Block until one or more containers stop, then print their exit codes')

                break
            }

            "$baseCommand;attach" {
                [CompletionResult]::new('--detach-keys', 'detach-keys', [CompletionResultType]::ParameterName, 'Override the key sequence for detaching a container')
                [CompletionResult]::new('--no-stdin', 'no-stdin', [CompletionResultType]::ParameterName, 'Do not attach STDIN')
                [CompletionResult]::new('--sig-proxy', 'sig-proxy', [CompletionResultType]::ParameterName, 'Proxy all received signals to the process (default true)')

                break
            }
            "$baseCommand;build" {
                [CompletionResult]::new('--add-host', 'add-host', [CompletionResultType]::ParameterName, 'Add a custom host-to-IP mapping (host:ip)')
                [CompletionResult]::new('--build-arg', 'build-arg', [CompletionResultType]::ParameterName, 'Set build-time variables')
                [CompletionResult]::new('--cache-from', 'cache-from', [CompletionResultType]::ParameterName, 'Images to consider as cache sources')
                [CompletionResult]::new('--cgroup-parent', 'cgroup-parent', [CompletionResultType]::ParameterName, 'Optional parent cgroup for the container')
                [CompletionResult]::new('--compress', 'compress', [CompletionResultType]::ParameterName, 'Compress the build context using gzip')
                [CompletionResult]::new('--cpu-period', 'cpu-period', [CompletionResultType]::ParameterName, 'Limit the CPU CFS (Completely Fair Scheduler) period')
                [CompletionResult]::new('--cpu-quota', 'cpu-quota', [CompletionResultType]::ParameterName, 'Limit the CPU CFS (Completely Fair Scheduler) quota')
                [CompletionResult]::new('--cpu-shares', 'cpu-shares', [CompletionResultType]::ParameterName, 'CPU shares (relative weight)')
                [CompletionResult]::new('--cpuset-cpus', 'cpuset-cpus', [CompletionResultType]::ParameterName, 'CPUs in which to allow execution (0-3, 0,1)')
                [CompletionResult]::new('--cpuset-mems', 'cpuset-mems', [CompletionResultType]::ParameterName, 'MEMs in which to allow execution (0-3, 0,1)')
                [CompletionResult]::new('--disable-content-trust', 'disable-content-trust', [CompletionResultType]::ParameterName, 'Skip image verification (default true)')
                [CompletionResult]::new('--file', 'file', [CompletionResultType]::ParameterName, 'Name of the Dockerfile (Default is ''PATH/Dockerfile'')')
                [CompletionResult]::new('--force-rm', 'force-rm', [CompletionResultType]::ParameterName, 'Always remove intermediate containers')
                [CompletionResult]::new('--iidfile', 'iidfile', [CompletionResultType]::ParameterName, 'Write the image ID to the file')
                [CompletionResult]::new('--isolation', 'isolation', [CompletionResultType]::ParameterName, 'Container isolation technology')
                [CompletionResult]::new('--label', 'label', [CompletionResultType]::ParameterName, 'Set metadata for an image')
                [CompletionResult]::new('--memory', 'memory', [CompletionResultType]::ParameterName, 'Memory limit')
                [CompletionResult]::new('--memory-swap', 'memory-swap', [CompletionResultType]::ParameterName, 'Swap limit equal to memory plus swap: ''-1'' to enable unlimited swap')
                [CompletionResult]::new('--network', 'network', [CompletionResultType]::ParameterName, 'Set the networking mode for the RUN instructions during build (default "default")')
                [CompletionResult]::new('--no-cache', 'no-cache', [CompletionResultType]::ParameterName, 'Do not use cache when building the image')
                [CompletionResult]::new('--pull', 'pull', [CompletionResultType]::ParameterName, 'Always attempt to pull a newer version of the image')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress the build output and print image ID on success')
                [CompletionResult]::new('--rm', 'rm', [CompletionResultType]::ParameterName, 'Remove intermediate containers after a successful build (default true)')
                [CompletionResult]::new('--security-opt', 'security-opt', [CompletionResultType]::ParameterName, 'Security options')
                [CompletionResult]::new('--shm-size', 'shm-size', [CompletionResultType]::ParameterName, 'Size of /dev/shm')
                [CompletionResult]::new('--tag', 'tag', [CompletionResultType]::ParameterName, 'Name and optionally a tag in the ''name:tag'' format')
                [CompletionResult]::new('--target', 'target', [CompletionResultType]::ParameterName, 'Set the target build stage to build.')
                [CompletionResult]::new('--ulimit', 'ulimit', [CompletionResultType]::ParameterName, 'Ulimit options (default [])')

                break
            }
            "$baseCommand;commit" {
                [CompletionResult]::new('--author', 'author', [CompletionResultType]::ParameterName, 'Author (e.g., "John Hannibal Smith <hannibal@a-team.com>")')
                [CompletionResult]::new('--change', 'change', [CompletionResultType]::ParameterName, 'Apply Dockerfile instruction to the created image')
                [CompletionResult]::new('--message', 'message', [CompletionResultType]::ParameterName, 'Commit message')
                [CompletionResult]::new('--pause', 'pause', [CompletionResultType]::ParameterName, 'Pause container during commit (default true)')

                break
            }
            "$baseCommand;cp" {
                [CompletionResult]::new('--archive', 'archive', [CompletionResultType]::ParameterName, 'Archive mode (copy all uid/gid information)')
                [CompletionResult]::new('--follow-link', 'follow-link', [CompletionResultType]::ParameterName, 'Always follow symbol link in SRC_PATH')

                break
            }
            "$baseCommand;create" {
                [CompletionResult]::new('--add-host', 'add-host', [CompletionResultType]::ParameterName, 'Add a custom host-to-IP mapping (host:ip)')
                [CompletionResult]::new('--attach', 'attach', [CompletionResultType]::ParameterName, 'Attach to STDIN, STDOUT or STDERR')
                [CompletionResult]::new('--blkio-weight', 'blkio-weight', [CompletionResultType]::ParameterName, 'Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)')
                [CompletionResult]::new('--blkio-weight-device', 'blkio-weight-device', [CompletionResultType]::ParameterName, 'Block IO weight (relative device weight) (default [])')
                [CompletionResult]::new('--cap-add', 'cap-add', [CompletionResultType]::ParameterName, 'Add Linux capabilities')
                [CompletionResult]::new('--cap-drop', 'cap-drop', [CompletionResultType]::ParameterName, 'Drop Linux capabilities')
                [CompletionResult]::new('--cgroup-parent', 'cgroup-parent', [CompletionResultType]::ParameterName, 'Optional parent cgroup for the container')
                [CompletionResult]::new('--cgroupns', 'cgroupns', [CompletionResultType]::ParameterName, 'Cgroup namespace to use (host|private)')
                [CompletionResult]::new('--cidfile', 'cidfile', [CompletionResultType]::ParameterName, 'Write the container ID to the file')
                [CompletionResult]::new('--cpu-period', 'cpu-period', [CompletionResultType]::ParameterName, 'Limit CPU CFS (Completely Fair Scheduler) period')
                [CompletionResult]::new('--cpu-quota', 'cpu-quota', [CompletionResultType]::ParameterName, 'Limit CPU CFS (Completely Fair Scheduler) quota')
                [CompletionResult]::new('--cpu-rt-period', 'cpu-rt-period', [CompletionResultType]::ParameterName, 'Limit CPU real-time period in microseconds')
                [CompletionResult]::new('--cpu-rt-runtime', 'cpu-rt-runtime', [CompletionResultType]::ParameterName, 'Limit CPU real-time runtime in microseconds')
                [CompletionResult]::new('--cpu-shares', 'cpu-shares', [CompletionResultType]::ParameterName, 'CPU shares (relative weight)')
                [CompletionResult]::new('--cpus', 'cpus', [CompletionResultType]::ParameterName, 'Number of CPUs')
                [CompletionResult]::new('--cpuset-cpus', 'cpuset-cpus', [CompletionResultType]::ParameterName, 'CPUs in which to allow execution (0-3, 0,1)')
                [CompletionResult]::new('--cpuset-mems', 'cpuset-mems', [CompletionResultType]::ParameterName, 'MEMs in which to allow execution (0-3, 0,1)')
                [CompletionResult]::new('--device', 'device', [CompletionResultType]::ParameterName, 'Add a host device to the container')
                [CompletionResult]::new('--device-cgroup-rule', 'device-cgroup-rule', [CompletionResultType]::ParameterName, 'Add a rule to the cgroup allowed devices list')
                [CompletionResult]::new('--device-read-bps', 'device-read-bps', [CompletionResultType]::ParameterName, 'Limit read rate (bytes per second) from a device (default [])')
                [CompletionResult]::new('--device-read-iops', 'device-read-iops', [CompletionResultType]::ParameterName, 'Limit read rate (IO per second) from a device (default [])')
                [CompletionResult]::new('--device-write-bps', 'device-write-bps', [CompletionResultType]::ParameterName, 'Limit write rate (bytes per second) to a device (default [])')
                [CompletionResult]::new('--device-write-iops', 'device-write-iops', [CompletionResultType]::ParameterName, 'Limit write rate (IO per second) to a device (default [])')
                [CompletionResult]::new('--disable-content-trust', 'disable-content-trust', [CompletionResultType]::ParameterName, 'Skip image verification (default true)')
                [CompletionResult]::new('--dns', 'dns', [CompletionResultType]::ParameterName, 'Set custom DNS servers')
                [CompletionResult]::new('--dns-option', 'dns-option', [CompletionResultType]::ParameterName, 'Set DNS options')
                [CompletionResult]::new('--dns-search', 'dns-search', [CompletionResultType]::ParameterName, 'Set custom DNS search domains')
                [CompletionResult]::new('--domainname', 'domainname', [CompletionResultType]::ParameterName, 'Container NIS domain name')
                [CompletionResult]::new('--entrypoint', 'entrypoint', [CompletionResultType]::ParameterName, 'Overwrite the default ENTRYPOINT of the image')
                [CompletionResult]::new('--env', 'env', [CompletionResultType]::ParameterName, 'Set environment variables')
                [CompletionResult]::new('--env-file', 'env-file', [CompletionResultType]::ParameterName, 'Read in a file of environment variables')
                [CompletionResult]::new('--expose', 'expose', [CompletionResultType]::ParameterName, 'Expose a port or a range of ports')
                [CompletionResult]::new('--gpus', 'gpus', [CompletionResultType]::ParameterName, 'GPU devices to add to the container (''all'' to pass all GPUs)')
                [CompletionResult]::new('--group-add', 'group-add', [CompletionResultType]::ParameterName, 'Add additional groups to join')
                [CompletionResult]::new('--health-cmd', 'health-cmd', [CompletionResultType]::ParameterName, 'Command to run to check health')
                [CompletionResult]::new('--health-interval', 'health-interval', [CompletionResultType]::ParameterName, 'Time between running the check (ms|s|m|h) (default 0s)')
                [CompletionResult]::new('--health-retries', 'health-retries', [CompletionResultType]::ParameterName, 'Consecutive failures needed to report unhealthy')
                [CompletionResult]::new('--health-start-period', 'health-start-period', [CompletionResultType]::ParameterName, 'Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)')
                [CompletionResult]::new('--health-timeout', 'health-timeout', [CompletionResultType]::ParameterName, 'Maximum time to allow one check to run (ms|s|m|h) (default 0s)')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print usage')
                [CompletionResult]::new('--hostname', 'hostname', [CompletionResultType]::ParameterName, 'Container host name')
                [CompletionResult]::new('--init', 'init', [CompletionResultType]::ParameterName, 'Run an init inside the container that forwards signals and reaps processes')
                [CompletionResult]::new('--interactive', 'interactive', [CompletionResultType]::ParameterName, 'Keep STDIN open even if not attached')
                [CompletionResult]::new('--ip', 'ip', [CompletionResultType]::ParameterName, 'IPv4 address (e.g., 172.30.100.104)')
                [CompletionResult]::new('--ip6', 'ip6', [CompletionResultType]::ParameterName, 'IPv6 address (e.g., 2001:db8::33)')
                [CompletionResult]::new('--ipc', 'ipc', [CompletionResultType]::ParameterName, 'IPC mode to use')
                [CompletionResult]::new('--isolation', 'isolation', [CompletionResultType]::ParameterName, 'Container isolation technology')
                [CompletionResult]::new('--kernel-memory', 'kernel-memory', [CompletionResultType]::ParameterName, 'Kernel memory limit')
                [CompletionResult]::new('--label', 'label', [CompletionResultType]::ParameterName, 'Set meta data on a container')
                [CompletionResult]::new('--label-file', 'label-file', [CompletionResultType]::ParameterName, 'Read in a line delimited file of labels')
                [CompletionResult]::new('--link', 'link', [CompletionResultType]::ParameterName, 'Add link to another container')
                [CompletionResult]::new('--link-local-ip', 'link-local-ip', [CompletionResultType]::ParameterName, 'Container IPv4/IPv6 link-local addresses')
                [CompletionResult]::new('--log-driver', 'log-driver', [CompletionResultType]::ParameterName, 'Logging driver for the container')
                [CompletionResult]::new('--log-opt', 'log-opt', [CompletionResultType]::ParameterName, 'Log driver options')
                [CompletionResult]::new('--mac-address', 'mac-address', [CompletionResultType]::ParameterName, 'Container MAC address (e.g., 92:d0:c6:0a:29:33)')
                [CompletionResult]::new('--memory', 'memory', [CompletionResultType]::ParameterName, 'Memory limit')
                [CompletionResult]::new('--memory-reservation', 'memory-reservation', [CompletionResultType]::ParameterName, 'Memory soft limit')
                [CompletionResult]::new('--memory-swap', 'memory-swap', [CompletionResultType]::ParameterName, 'Swap limit equal to memory plus swap: ''-1'' to enable unlimited swap')
                [CompletionResult]::new('--memory-swappiness', 'memory-swappiness', [CompletionResultType]::ParameterName, 'Tune container memory swappiness (0 to 100) (default -1)')
                [CompletionResult]::new('--mount', 'mount', [CompletionResultType]::ParameterName, 'Attach a filesystem mount to the container')
                [CompletionResult]::new('--name', 'name', [CompletionResultType]::ParameterName, 'Assign a name to the container')
                [CompletionResult]::new('--network', 'network', [CompletionResultType]::ParameterName, 'Connect a container to a network')
                [CompletionResult]::new('--network-alias', 'network-alias', [CompletionResultType]::ParameterName, 'Add network-scoped alias for the container')
                [CompletionResult]::new('--no-healthcheck', 'no-healthcheck', [CompletionResultType]::ParameterName, 'Disable any container-specified HEALTHCHECK')
                [CompletionResult]::new('--oom-kill-disable', 'oom-kill-disable', [CompletionResultType]::ParameterName, 'Disable OOM Killer')
                [CompletionResult]::new('--oom-score-adj', 'oom-score-adj', [CompletionResultType]::ParameterName, 'Tune host''s OOM preferences (-1000 to 1000)')
                [CompletionResult]::new('--pid', 'pid', [CompletionResultType]::ParameterName, 'PID namespace to use')
                [CompletionResult]::new('--pids-limit', 'pids-limit', [CompletionResultType]::ParameterName, 'Tune container pids limit (set -1 for unlimited)')
                [CompletionResult]::new('--platform', 'platform', [CompletionResultType]::ParameterName, 'Set platform if server is multi-platform capable')
                [CompletionResult]::new('--privileged', 'privileged', [CompletionResultType]::ParameterName, 'Give extended privileges to this container')
                [CompletionResult]::new('--publish', 'publish', [CompletionResultType]::ParameterName, 'Publish a container''s port(s) to the host')
                [CompletionResult]::new('--publish-all', 'publish-all', [CompletionResultType]::ParameterName, 'Publish all exposed ports to random ports')
                [CompletionResult]::new('--pull', 'pull', [CompletionResultType]::ParameterName, 'Pull image before creating ("always"|"missing"|"never") (default "missing")')
                [CompletionResult]::new('--read-only', 'read-only', [CompletionResultType]::ParameterName, 'Mount the container''s root filesystem as read only')
                [CompletionResult]::new('--restart', 'restart', [CompletionResultType]::ParameterName, 'Restart policy to apply when a container exits (default "no")')
                [CompletionResult]::new('--rm', 'rm', [CompletionResultType]::ParameterName, 'Automatically remove the container when it exits')
                [CompletionResult]::new('--runtime', 'runtime', [CompletionResultType]::ParameterName, 'Runtime to use for this container')
                [CompletionResult]::new('--security-opt', 'security-opt', [CompletionResultType]::ParameterName, 'Security Options')
                [CompletionResult]::new('--shm-size', 'shm-size', [CompletionResultType]::ParameterName, 'Size of /dev/shm')
                [CompletionResult]::new('--stop-signal', 'stop-signal', [CompletionResultType]::ParameterName, 'Signal to stop a container (default "SIGTERM")')
                [CompletionResult]::new('--stop-timeout', 'stop-timeout', [CompletionResultType]::ParameterName, 'Timeout (in seconds) to stop a container')
                [CompletionResult]::new('--storage-opt', 'storage-opt', [CompletionResultType]::ParameterName, 'Storage driver options for the container')
                [CompletionResult]::new('--sysctl', 'sysctl', [CompletionResultType]::ParameterName, 'Sysctl options (default map[])')
                [CompletionResult]::new('--tmpfs', 'tmpfs', [CompletionResultType]::ParameterName, 'Mount a tmpfs directory')
                [CompletionResult]::new('--tty', 'tty', [CompletionResultType]::ParameterName, 'Allocate a pseudo-TTY')
                [CompletionResult]::new('--ulimit', 'ulimit', [CompletionResultType]::ParameterName, 'Ulimit options (default [])')
                [CompletionResult]::new('--user', 'user', [CompletionResultType]::ParameterName, 'Username or UID (format: <name|uid>[:<group|gid>])')
                [CompletionResult]::new('--userns', 'userns', [CompletionResultType]::ParameterName, 'User namespace to use')
                [CompletionResult]::new('--uts', 'uts', [CompletionResultType]::ParameterName, 'UTS namespace to use')
                [CompletionResult]::new('--volume', 'volume', [CompletionResultType]::ParameterName, 'Bind mount a volume')
                [CompletionResult]::new('--volume-driver', 'volume-driver', [CompletionResultType]::ParameterName, 'Optional volume driver for the container')
                [CompletionResult]::new('--volumes-from', 'volumes-from', [CompletionResultType]::ParameterName, 'Mount volumes from the specified container(s)')
                [CompletionResult]::new('--workdir', 'workdir', [CompletionResultType]::ParameterName, 'Working directory inside the container')

                break
            }
            "$baseCommand;diff" {

                break
            }
            "$baseCommand;events" {
                [CompletionResult]::new('--filter', 'filter', [CompletionResultType]::ParameterName, 'Filter output based on conditions provided')
                [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Format the output using the given Go template')
                [CompletionResult]::new('--since', 'since', [CompletionResultType]::ParameterName, 'Show all events created since timestamp')
                [CompletionResult]::new('--until', 'until', [CompletionResultType]::ParameterName, 'Stream events until this timestamp')

                break
            }
            "$baseCommand;exec" {
                [CompletionResult]::new('--detach', 'detach', [CompletionResultType]::ParameterName, 'Detached mode: run command in the background')
                [CompletionResult]::new('--detach-keys', 'detach-keys', [CompletionResultType]::ParameterName, 'Override the key sequence for detaching a container')
                [CompletionResult]::new('--env', 'env', [CompletionResultType]::ParameterName, 'Set environment variables')
                [CompletionResult]::new('--env-file', 'env-file', [CompletionResultType]::ParameterName, 'Read in a file of environment variables')
                [CompletionResult]::new('--interactive', 'interactive', [CompletionResultType]::ParameterName, 'Keep STDIN open even if not attached')
                [CompletionResult]::new('--privileged', 'privileged', [CompletionResultType]::ParameterName, 'Give extended privileges to the command')
                [CompletionResult]::new('--tty', 'tty', [CompletionResultType]::ParameterName, 'Allocate a pseudo-TTY')
                [CompletionResult]::new('--user', 'user', [CompletionResultType]::ParameterName, 'Username or UID (format: <name|uid>[:<group|gid>])')
                [CompletionResult]::new('--workdir', 'workdir', [CompletionResultType]::ParameterName, 'Working directory inside the container')

                break
            }
            "$baseCommand;export" {
                [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Write to a file, instead of STDOUT')

                break
            }
            "$baseCommand;history" {
                [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Pretty-print images using a Go template')
                [CompletionResult]::new('--human', 'human', [CompletionResultType]::ParameterName, 'Print sizes and dates in human readable format (default true)')
                [CompletionResult]::new('--no-trunc', 'no-trunc', [CompletionResultType]::ParameterName, 'Don''t truncate output')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Only show image IDs')

                break
            }
            "$baseCommand;images" {
                [CompletionResult]::new('--all', 'all', [CompletionResultType]::ParameterName, 'Show all images (default hides intermediate images)')
                [CompletionResult]::new('--digests', 'digests', [CompletionResultType]::ParameterName, 'Show digests')
                [CompletionResult]::new('--filter', 'filter', [CompletionResultType]::ParameterName, 'Filter output based on conditions provided')
                [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Pretty-print images using a Go template')
                [CompletionResult]::new('--no-trunc', 'no-trunc', [CompletionResultType]::ParameterName, 'Don''t truncate output')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Only show image IDs')

                break
            }
            "$baseCommand;import" {
                [CompletionResult]::new('--change', 'change', [CompletionResultType]::ParameterName, 'Apply Dockerfile instruction to the created image')
                [CompletionResult]::new('--message', 'message', [CompletionResultType]::ParameterName, 'Set commit message for imported image')
                [CompletionResult]::new('--platform', 'platform', [CompletionResultType]::ParameterName, 'Set platform if server is multi-platform capable')

                break
            }
            "$baseCommand;info" {
                [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Format the output using the given Go template')

                break
            }
            "$baseCommand;inspect" {
                [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Format the output using the given Go template')
                [CompletionResult]::new('--size', 'size', [CompletionResultType]::ParameterName, 'Display total file sizes if the type is container')
                [CompletionResult]::new('--type', 'type', [CompletionResultType]::ParameterName, 'Return JSON for specified type')

                break
            }
            "$baseCommand;kill" {
                [CompletionResult]::new('--signal', 'signal', [CompletionResultType]::ParameterName, 'Signal to send to the container (default "KILL")')

                break
            }
            "$baseCommand;load" {
                [CompletionResult]::new('--input', 'input', [CompletionResultType]::ParameterName, 'Read from tar archive file, instead of STDIN')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress the load output')

                break
            }
            "$baseCommand;login" {
                [CompletionResult]::new('--password', 'password', [CompletionResultType]::ParameterName, 'Password')
                [CompletionResult]::new('--password-stdin', 'password-stdin', [CompletionResultType]::ParameterName, 'Take the password from stdin')
                [CompletionResult]::new('--username', 'username', [CompletionResultType]::ParameterName, 'Username')

                break
            }
            "$baseCommand;logout" {

                break
            }
            "$baseCommand;logs" {
                [CompletionResult]::new('--details', 'details', [CompletionResultType]::ParameterName, 'Show extra details provided to logs')
                [CompletionResult]::new('--follow', 'follow', [CompletionResultType]::ParameterName, 'Follow log output')
                [CompletionResult]::new('--since', 'since', [CompletionResultType]::ParameterName, 'Show logs since timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)')
                [CompletionResult]::new('--tail', 'tail', [CompletionResultType]::ParameterName, 'Number of lines to show from the end of the logs (default "all")')
                [CompletionResult]::new('--timestamps', 'timestamps', [CompletionResultType]::ParameterName, 'Show timestamps')
                [CompletionResult]::new('--until', 'until', [CompletionResultType]::ParameterName, 'Show logs before a timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)')

                break
            }
            "$baseCommand;pause" {

                break
            }
            "$baseCommand;port" {

                break
            }
            "$baseCommand;ps" {
                [CompletionResult]::new('--all', 'all', [CompletionResultType]::ParameterName, 'Show all containers (default shows just running)')
                [CompletionResult]::new('--filter', 'filter', [CompletionResultType]::ParameterName, 'Filter output based on conditions provided')
                [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Pretty-print containers using a Go template')
                [CompletionResult]::new('--last', 'last', [CompletionResultType]::ParameterName, 'Show n last created containers (includes all states) (default -1)')
                [CompletionResult]::new('--latest', 'latest', [CompletionResultType]::ParameterName, 'Show the latest created container (includes all states)')
                [CompletionResult]::new('--no-trunc', 'no-trunc', [CompletionResultType]::ParameterName, 'Don''t truncate output')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Only display container IDs')
                [CompletionResult]::new('--size', 'size', [CompletionResultType]::ParameterName, 'Display total file sizes')

                break
            }
            "$baseCommand;pull" {
                [CompletionResult]::new('--all-tags', 'all-tags', [CompletionResultType]::ParameterName, 'Download all tagged images in the repository')
                [CompletionResult]::new('--disable-content-trust', 'disable-content-trust', [CompletionResultType]::ParameterName, 'Skip image verification (default true)')
                [CompletionResult]::new('--platform', 'platform', [CompletionResultType]::ParameterName, 'Set platform if server is multi-platform capable')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress verbose output')

                break
            }
            "$baseCommand;push" {
                [CompletionResult]::new('--all-tags', 'all-tags', [CompletionResultType]::ParameterName, 'Push all tagged images in the repository')
                [CompletionResult]::new('--disable-content-trust', 'disable-content-trust', [CompletionResultType]::ParameterName, 'Skip image signing (default true)')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress verbose output')

                break
            }
            "$baseCommand;rename" {

                break
            }
            "$baseCommand;restart" {
                [CompletionResult]::new('--time', 'time', [CompletionResultType]::ParameterName, 'Seconds to wait for stop before killing the container (default 10)')

                break
            }
            "$baseCommand;rm" {
                [CompletionResult]::new('--force', 'force', [CompletionResultType]::ParameterName, 'Force the removal of a running container (uses SIGKILL)')
                [CompletionResult]::new('--link', 'link', [CompletionResultType]::ParameterName, 'Remove the specified link')
                [CompletionResult]::new('--volumes', 'volumes', [CompletionResultType]::ParameterName, 'Remove anonymous volumes associated with the container')

                break
            }
            "$baseCommand;rmi" {
                [CompletionResult]::new('--force', 'force', [CompletionResultType]::ParameterName, 'Force removal of the image')
                [CompletionResult]::new('--no-prune', 'no-prune', [CompletionResultType]::ParameterName, 'Do not delete untagged parents')

                break
            }
            "$baseCommand;run" {
                [CompletionResult]::new('--add-host', 'add-host', [CompletionResultType]::ParameterName, 'Add a custom host-to-IP mapping (host:ip)')
                [CompletionResult]::new('--attach', 'attach', [CompletionResultType]::ParameterName, 'Attach to STDIN, STDOUT or STDERR')
                [CompletionResult]::new('--blkio-weight', 'blkio-weight', [CompletionResultType]::ParameterName, 'Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)')
                [CompletionResult]::new('--blkio-weight-device', 'blkio-weight-device', [CompletionResultType]::ParameterName, 'Block IO weight (relative device weight) (default [])')
                [CompletionResult]::new('--cap-add', 'cap-add', [CompletionResultType]::ParameterName, 'Add Linux capabilities')
                [CompletionResult]::new('--cap-drop', 'cap-drop', [CompletionResultType]::ParameterName, 'Drop Linux capabilities')
                [CompletionResult]::new('--cgroup-parent', 'cgroup-parent', [CompletionResultType]::ParameterName, 'Optional parent cgroup for the container')
                [CompletionResult]::new('--cgroupns', 'cgroupns', [CompletionResultType]::ParameterName, 'Cgroup namespace to use (host|private)')
                [CompletionResult]::new('--cidfile', 'cidfile', [CompletionResultType]::ParameterName, 'Write the container ID to the file')
                [CompletionResult]::new('--cpu-period', 'cpu-period', [CompletionResultType]::ParameterName, 'Limit CPU CFS (Completely Fair Scheduler) period')
                [CompletionResult]::new('--cpu-quota', 'cpu-quota', [CompletionResultType]::ParameterName, 'Limit CPU CFS (Completely Fair Scheduler) quota')
                [CompletionResult]::new('--cpu-rt-period', 'cpu-rt-period', [CompletionResultType]::ParameterName, 'Limit CPU real-time period in microseconds')
                [CompletionResult]::new('--cpu-rt-runtime', 'cpu-rt-runtime', [CompletionResultType]::ParameterName, 'Limit CPU real-time runtime in microseconds')
                [CompletionResult]::new('--cpu-shares', 'cpu-shares', [CompletionResultType]::ParameterName, 'CPU shares (relative weight)')
                [CompletionResult]::new('--cpus', 'cpus', [CompletionResultType]::ParameterName, 'Number of CPUs')
                [CompletionResult]::new('--cpuset-cpus', 'cpuset-cpus', [CompletionResultType]::ParameterName, 'CPUs in which to allow execution (0-3, 0,1)')
                [CompletionResult]::new('--cpuset-mems', 'cpuset-mems', [CompletionResultType]::ParameterName, 'MEMs in which to allow execution (0-3, 0,1)')
                [CompletionResult]::new('--detach', 'detach', [CompletionResultType]::ParameterName, 'Run container in background and print container ID')
                [CompletionResult]::new('--detach-keys', 'detach-keys', [CompletionResultType]::ParameterName, 'Override the key sequence for detaching a container')
                [CompletionResult]::new('--device', 'device', [CompletionResultType]::ParameterName, 'Add a host device to the container')
                [CompletionResult]::new('--device-cgroup-rule', 'device-cgroup-rule', [CompletionResultType]::ParameterName, 'Add a rule to the cgroup allowed devices list')
                [CompletionResult]::new('--device-read-bps', 'device-read-bps', [CompletionResultType]::ParameterName, 'Limit read rate (bytes per second) from a device (default [])')
                [CompletionResult]::new('--device-read-iops', 'device-read-iops', [CompletionResultType]::ParameterName, 'Limit read rate (IO per second) from a device (default [])')
                [CompletionResult]::new('--device-write-bps', 'device-write-bps', [CompletionResultType]::ParameterName, 'Limit write rate (bytes per second) to a device (default [])')
                [CompletionResult]::new('--device-write-iops', 'device-write-iops', [CompletionResultType]::ParameterName, 'Limit write rate (IO per second) to a device (default [])')
                [CompletionResult]::new('--disable-content-trust', 'disable-content-trust', [CompletionResultType]::ParameterName, 'Skip image verification (default true)')
                [CompletionResult]::new('--dns', 'dns', [CompletionResultType]::ParameterName, 'Set custom DNS servers')
                [CompletionResult]::new('--dns-option', 'dns-option', [CompletionResultType]::ParameterName, 'Set DNS options')
                [CompletionResult]::new('--dns-search', 'dns-search', [CompletionResultType]::ParameterName, 'Set custom DNS search domains')
                [CompletionResult]::new('--domainname', 'domainname', [CompletionResultType]::ParameterName, 'Container NIS domain name')
                [CompletionResult]::new('--entrypoint', 'entrypoint', [CompletionResultType]::ParameterName, 'Overwrite the default ENTRYPOINT of the image')
                [CompletionResult]::new('--env', 'env', [CompletionResultType]::ParameterName, 'Set environment variables')
                [CompletionResult]::new('--env-file', 'env-file', [CompletionResultType]::ParameterName, 'Read in a file of environment variables')
                [CompletionResult]::new('--expose', 'expose', [CompletionResultType]::ParameterName, 'Expose a port or a range of ports')
                [CompletionResult]::new('--gpus', 'gpus', [CompletionResultType]::ParameterName, 'GPU devices to add to the container (''all'' to pass all GPUs)')
                [CompletionResult]::new('--group-add', 'group-add', [CompletionResultType]::ParameterName, 'Add additional groups to join')
                [CompletionResult]::new('--health-cmd', 'health-cmd', [CompletionResultType]::ParameterName, 'Command to run to check health')
                [CompletionResult]::new('--health-interval', 'health-interval', [CompletionResultType]::ParameterName, 'Time between running the check (ms|s|m|h) (default 0s)')
                [CompletionResult]::new('--health-retries', 'health-retries', [CompletionResultType]::ParameterName, 'Consecutive failures needed to report unhealthy')
                [CompletionResult]::new('--health-start-period', 'health-start-period', [CompletionResultType]::ParameterName, 'Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)')
                [CompletionResult]::new('--health-timeout', 'health-timeout', [CompletionResultType]::ParameterName, 'Maximum time to allow one check to run (ms|s|m|h) (default 0s)')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print usage')
                [CompletionResult]::new('--hostname', 'hostname', [CompletionResultType]::ParameterName, 'Container host name')
                [CompletionResult]::new('--init', 'init', [CompletionResultType]::ParameterName, 'Run an init inside the container that forwards signals and reaps processes')
                [CompletionResult]::new('--interactive', 'interactive', [CompletionResultType]::ParameterName, 'Keep STDIN open even if not attached')
                [CompletionResult]::new('--ip', 'ip', [CompletionResultType]::ParameterName, 'IPv4 address (e.g., 172.30.100.104)')
                [CompletionResult]::new('--ip6', 'ip6', [CompletionResultType]::ParameterName, 'IPv6 address (e.g., 2001:db8::33)')
                [CompletionResult]::new('--ipc', 'ipc', [CompletionResultType]::ParameterName, 'IPC mode to use')
                [CompletionResult]::new('--isolation', 'isolation', [CompletionResultType]::ParameterName, 'Container isolation technology')
                [CompletionResult]::new('--kernel-memory', 'kernel-memory', [CompletionResultType]::ParameterName, 'Kernel memory limit')
                [CompletionResult]::new('--label', 'label', [CompletionResultType]::ParameterName, 'Set meta data on a container')
                [CompletionResult]::new('--label-file', 'label-file', [CompletionResultType]::ParameterName, 'Read in a line delimited file of labels')
                [CompletionResult]::new('--link', 'link', [CompletionResultType]::ParameterName, 'Add link to another container')
                [CompletionResult]::new('--link-local-ip', 'link-local-ip', [CompletionResultType]::ParameterName, 'Container IPv4/IPv6 link-local addresses')
                [CompletionResult]::new('--log-driver', 'log-driver', [CompletionResultType]::ParameterName, 'Logging driver for the container')
                [CompletionResult]::new('--log-opt', 'log-opt', [CompletionResultType]::ParameterName, 'Log driver options')
                [CompletionResult]::new('--mac-address', 'mac-address', [CompletionResultType]::ParameterName, 'Container MAC address (e.g., 92:d0:c6:0a:29:33)')
                [CompletionResult]::new('--memory', 'memory', [CompletionResultType]::ParameterName, 'Memory limit')
                [CompletionResult]::new('--memory-reservation', 'memory-reservation', [CompletionResultType]::ParameterName, 'Memory soft limit')
                [CompletionResult]::new('--memory-swap', 'memory-swap', [CompletionResultType]::ParameterName, 'Swap limit equal to memory plus swap: ''-1'' to enable unlimited swap')
                [CompletionResult]::new('--memory-swappiness', 'memory-swappiness', [CompletionResultType]::ParameterName, 'Tune container memory swappiness (0 to 100) (default -1)')
                [CompletionResult]::new('--mount', 'mount', [CompletionResultType]::ParameterName, 'Attach a filesystem mount to the container')
                [CompletionResult]::new('--name', 'name', [CompletionResultType]::ParameterName, 'Assign a name to the container')
                [CompletionResult]::new('--network', 'network', [CompletionResultType]::ParameterName, 'Connect a container to a network')
                [CompletionResult]::new('--network-alias', 'network-alias', [CompletionResultType]::ParameterName, 'Add network-scoped alias for the container')
                [CompletionResult]::new('--no-healthcheck', 'no-healthcheck', [CompletionResultType]::ParameterName, 'Disable any container-specified HEALTHCHECK')
                [CompletionResult]::new('--oom-kill-disable', 'oom-kill-disable', [CompletionResultType]::ParameterName, 'Disable OOM Killer')
                [CompletionResult]::new('--oom-score-adj', 'oom-score-adj', [CompletionResultType]::ParameterName, 'Tune host''s OOM preferences (-1000 to 1000)')
                [CompletionResult]::new('--pid', 'pid', [CompletionResultType]::ParameterName, 'PID namespace to use')
                [CompletionResult]::new('--pids-limit', 'pids-limit', [CompletionResultType]::ParameterName, 'Tune container pids limit (set -1 for unlimited)')
                [CompletionResult]::new('--platform', 'platform', [CompletionResultType]::ParameterName, 'Set platform if server is multi-platform capable')
                [CompletionResult]::new('--privileged', 'privileged', [CompletionResultType]::ParameterName, 'Give extended privileges to this container')
                [CompletionResult]::new('--publish', 'publish', [CompletionResultType]::ParameterName, 'Publish a container''s port(s) to the host')
                [CompletionResult]::new('--publish-all', 'publish-all', [CompletionResultType]::ParameterName, 'Publish all exposed ports to random ports')
                [CompletionResult]::new('--pull', 'pull', [CompletionResultType]::ParameterName, 'Pull image before running ("always"|"missing"|"never") (default "missing")')
                [CompletionResult]::new('--read-only', 'read-only', [CompletionResultType]::ParameterName, 'Mount the container''s root filesystem as read only')
                [CompletionResult]::new('--restart', 'restart', [CompletionResultType]::ParameterName, 'Restart policy to apply when a container exits (default "no")')
                [CompletionResult]::new('--rm', 'rm', [CompletionResultType]::ParameterName, 'Automatically remove the container when it exits')
                [CompletionResult]::new('--runtime', 'runtime', [CompletionResultType]::ParameterName, 'Runtime to use for this container')
                [CompletionResult]::new('--security-opt', 'security-opt', [CompletionResultType]::ParameterName, 'Security Options')
                [CompletionResult]::new('--shm-size', 'shm-size', [CompletionResultType]::ParameterName, 'Size of /dev/shm')
                [CompletionResult]::new('--sig-proxy', 'sig-proxy', [CompletionResultType]::ParameterName, 'Proxy received signals to the process (default true)')
                [CompletionResult]::new('--stop-signal', 'stop-signal', [CompletionResultType]::ParameterName, 'Signal to stop a container (default "SIGTERM")')
                [CompletionResult]::new('--stop-timeout', 'stop-timeout', [CompletionResultType]::ParameterName, 'Timeout (in seconds) to stop a container')
                [CompletionResult]::new('--storage-opt', 'storage-opt', [CompletionResultType]::ParameterName, 'Storage driver options for the container')
                [CompletionResult]::new('--sysctl', 'sysctl', [CompletionResultType]::ParameterName, 'Sysctl options (default map[])')
                [CompletionResult]::new('--tmpfs', 'tmpfs', [CompletionResultType]::ParameterName, 'Mount a tmpfs directory')
                [CompletionResult]::new('--tty', 'tty', [CompletionResultType]::ParameterName, 'Allocate a pseudo-TTY')
                [CompletionResult]::new('--ulimit', 'ulimit', [CompletionResultType]::ParameterName, 'Ulimit options (default [])')
                [CompletionResult]::new('--user', 'user', [CompletionResultType]::ParameterName, 'Username or UID (format: <name|uid>[:<group|gid>])')
                [CompletionResult]::new('--userns', 'userns', [CompletionResultType]::ParameterName, 'User namespace to use')
                [CompletionResult]::new('--uts', 'uts', [CompletionResultType]::ParameterName, 'UTS namespace to use')
                [CompletionResult]::new('--volume', 'volume', [CompletionResultType]::ParameterName, 'Bind mount a volume')
                [CompletionResult]::new('--volume-driver', 'volume-driver', [CompletionResultType]::ParameterName, 'Optional volume driver for the container')
                [CompletionResult]::new('--volumes-from', 'volumes-from', [CompletionResultType]::ParameterName, 'Mount volumes from the specified container(s)')
                [CompletionResult]::new('--workdir', 'workdir', [CompletionResultType]::ParameterName, 'Working directory inside the container')

                break
            }
            "$baseCommand;save" {
                [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Write to a file, instead of STDOUT')

                break
            }
            "$baseCommand;search" {
                [CompletionResult]::new('--filter', 'filter', [CompletionResultType]::ParameterName, 'Filter output based on conditions provided')
                [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Pretty-print search using a Go template')
                [CompletionResult]::new('--limit', 'limit', [CompletionResultType]::ParameterName, 'Max number of search results (default 25)')
                [CompletionResult]::new('--no-trunc', 'no-trunc', [CompletionResultType]::ParameterName, 'Don''t truncate output')

                break
            }
            "$baseCommand;start" {
                [CompletionResult]::new('--attach', 'attach', [CompletionResultType]::ParameterName, 'Attach STDOUT/STDERR and forward signals')
                [CompletionResult]::new('--detach-keys', 'detach-keys', [CompletionResultType]::ParameterName, 'Override the key sequence for detaching a container')
                [CompletionResult]::new('--interactive', 'interactive', [CompletionResultType]::ParameterName, 'Attach container''s STDIN')

                break
            }
            "$baseCommand;stats" {
                [CompletionResult]::new('--all', 'all', [CompletionResultType]::ParameterName, 'Show all containers (default shows just running)')
                [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Pretty-print images using a Go template')
                [CompletionResult]::new('--no-stream', 'no-stream', [CompletionResultType]::ParameterName, 'Disable streaming stats and only pull the first result')
                [CompletionResult]::new('--no-trunc', 'no-trunc', [CompletionResultType]::ParameterName, 'Do not truncate output')

                break
            }
            "$baseCommand;stop" {
                [CompletionResult]::new('--time', 'time', [CompletionResultType]::ParameterName, 'Seconds to wait for stop before killing it (default 10)')

                break
            }
            "$baseCommand;tag" {

                break
            }
            "$baseCommand;top" {

                break
            }
            "$baseCommand;unpause" {

                break
            }
            "$baseCommand;update" {
                [CompletionResult]::new('--blkio-weight', 'blkio-weight', [CompletionResultType]::ParameterName, 'Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)')
                [CompletionResult]::new('--cpu-period', 'cpu-period', [CompletionResultType]::ParameterName, 'Limit CPU CFS (Completely Fair Scheduler) period')
                [CompletionResult]::new('--cpu-quota', 'cpu-quota', [CompletionResultType]::ParameterName, 'Limit CPU CFS (Completely Fair Scheduler) quota')
                [CompletionResult]::new('--cpu-rt-period', 'cpu-rt-period', [CompletionResultType]::ParameterName, 'Limit the CPU real-time period in microseconds')
                [CompletionResult]::new('--cpu-rt-runtime', 'cpu-rt-runtime', [CompletionResultType]::ParameterName, 'Limit the CPU real-time runtime in microseconds')
                [CompletionResult]::new('--cpu-shares', 'cpu-shares', [CompletionResultType]::ParameterName, 'CPU shares (relative weight)')
                [CompletionResult]::new('--cpus', 'cpus', [CompletionResultType]::ParameterName, 'Number of CPUs')
                [CompletionResult]::new('--cpuset-cpus', 'cpuset-cpus', [CompletionResultType]::ParameterName, 'CPUs in which to allow execution (0-3, 0,1)')
                [CompletionResult]::new('--cpuset-mems', 'cpuset-mems', [CompletionResultType]::ParameterName, 'MEMs in which to allow execution (0-3, 0,1)')
                [CompletionResult]::new('--kernel-memory', 'kernel-memory', [CompletionResultType]::ParameterName, 'Kernel memory limit')
                [CompletionResult]::new('--memory', 'memory', [CompletionResultType]::ParameterName, 'Memory limit')
                [CompletionResult]::new('--memory-reservation', 'memory-reservation', [CompletionResultType]::ParameterName, 'Memory soft limit')
                [CompletionResult]::new('--memory-swap', 'memory-swap', [CompletionResultType]::ParameterName, 'Swap limit equal to memory plus swap: ''-1'' to enable unlimited swap')
                [CompletionResult]::new('--pids-limit', 'pids-limit', [CompletionResultType]::ParameterName, 'Tune container pids limit (set -1 for unlimited)')
                [CompletionResult]::new('--restart', 'restart', [CompletionResultType]::ParameterName, 'Restart policy to apply when a container exits')

                break
            }
            "$baseCommand;version" {
                [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Format the output using the given Go template')
                [CompletionResult]::new('--kubeconfig', 'kubeconfig', [CompletionResultType]::ParameterName, 'Kubernetes config file')

                break
            }
            "$baseCommand;wait" {

                break
            }

        })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
    Sort-Object -Property ListItemText
}

Register-ArgumentCompleter -Native -CommandName 'docker' -ScriptBlock $script:dockerCommandTabComplete
Register-ArgumentCompleter -Native -CommandName 'd' -ScriptBlock $script:dockerCommandTabComplete
