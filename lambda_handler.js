exports.call = async function(event, context) {
    console.log("value1 = " + event.key1);
    console.log("value2 = " + event.key2);  
    return "some success message werner - it works";
    // or 
    // throw new Error("some error type"); 
 } 