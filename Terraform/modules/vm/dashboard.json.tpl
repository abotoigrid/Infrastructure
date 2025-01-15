{
  "widgets": [
    {
      "height": 6,
      "width": 6,
      "y": 0,
      "x": 0,
      "type": "metric",
      "properties": {
        "metrics": [
          [
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "${instance_id}",
            {
              "region": "eu-central-1"
            }
          ]
        ],
        "view": "timeSeries",
        "stacked": false,
        "region": "eu-central-1",
        "start": "-PT3H",
        "period": 60,
        "end": "P0D",
        "stat": "Average"
      }
    },
    {
      "height": 6,
      "width": 6,
      "y": 0,
      "x": 6,
      "type": "metric",
      "properties": {
        "view": "timeSeries",
        "stacked": true,
        "metrics": [
          ["AWS/EC2", "NetworkIn", "InstanceId", "${instance_id}"],
          [".", "NetworkOut", ".", "."]
        ],
        "region": "eu-central-1",
        "period": 60
      }
    },
    {
      "height": 6,
      "width": 6,
      "y": 0,
      "x": 12,
      "type": "metric",
      "properties": {
        "view": "timeSeries",
        "stacked": true,
        "metrics": [
          [
            "AWS/EC2",
            "StatusCheckFailed_System",
            "InstanceId",
            "${instance_id}"
          ],
          [".", "StatusCheckFailed_Instance", ".", "."]
        ],
        "region": "eu-central-1",
        "period": 60
      }
    },
    {
      "height": 6,
      "width": 12,
      "y": 6,
      "x": 0,
      "type": "metric",
      "properties": {
        "metrics": [
          [
            "CWAgent",
            "mem_available",
            "host",
            "${instance_private_ip_formatted}"
          ],
          [".", "mem_used_percent", ".", "."]
        ],
        "view": "gauge",
        "region": "eu-central-1",
        "yAxis": {
          "left": {
            "max": 100,
            "min": 0
          }
        },
        "legend": {
          "position": "bottom"
        },
        "setPeriodToTimeRange": false,
        "sparkline": true,
        "trend": true,
        "period": 60,
        "stat": "Average"
      }
    },
    {
      "height": 6,
      "width": 7,
      "y": 6,
      "x": 12,
      "type": "metric",
      "properties": {
        "metrics": [
          [
            "CWAgent",
            "disk_used_percent",
            "path",
            "/",
            "host",
            "${instance_private_ip_formatted}",
            "device",
            "nvme0n1p1",
            "fstype",
            "ext4"
          ],
          [".", "disk_free", ".", ".", ".", ".", ".", ".", ".", "."]
        ],
        "sparkline": true,
        "view": "gauge",
        "region": "eu-central-1",
        "stat": "Average",
        "period": 60,
        "yAxis": {
          "left": {
            "min": 0,
            "max": 100
          }
        },
        "stacked": false,
        "setPeriodToTimeRange": false,
        "trend": true
      }
    }
  ]
}