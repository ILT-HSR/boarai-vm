[[ -n "$ROS_DISTRO" ]] && return

if [[ "$(id -u)" == "1000" ]]; then
	export "$(cat /etc/default/ros2)"

	[[ $- == *i* ]] && echo "Initializing ROS2 environment for domain $ROS_DOMAIN_ID"

	if [ -z "$ROS_DISTRO" ]; then
		source /opt/ros2/setup.bash
	fi

	if [[ "$(ros2 daemon status)" == "The daemon is not running" ]]; then
		echo "Starting ROS2 daemon"
		ros2 daemon start
	fi
fi
