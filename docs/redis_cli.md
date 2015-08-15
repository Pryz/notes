**Commands.**

    # List all keys
    keys *

    # Get key members
    smembers KEY

    # Add key member
    sadd KEY MEMBERVALUE

    # Set a simple variable
    set class:variable "value"

    # Delete a variable
    del class::variable

**Delete multiple variables with xargs.**

    redis-cli KEYS "common*" | xargs redis-cli DEL
