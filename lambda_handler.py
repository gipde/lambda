def call(event, context):
    message = 'Hello {} {}!'.format(event)  
    return { 
        'message' : message
    }  