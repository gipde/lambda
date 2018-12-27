def call(event, context):
    message = 'Hello Werner'
    print(event)
    return { 
        'message' : message
    }  