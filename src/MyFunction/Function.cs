using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Amazon.Lambda.Core;
using Amazon.Lambda.Serialization.Json;

// Assembly attribute to enable the Lambda function's JSON input to be converted into a .NET class.
[assembly: LambdaSerializer(typeof(Amazon.Lambda.Serialization.Json.JsonSerializer))]
namespace MyFunction
{

    public class Person
    {

        public Person(string v)
        {
            this.Name = v;
        }
        public string Name { get; private set; }

        override public string ToString() => Name;

    }
    public class Function
    {

        /// <summary>
        /// A simple function that takes a string and does a ToUpper
        /// </summary>
        /// <param name="input"></param>
        /// <param name="context"></param>
        /// <returns></returns>
        public Person FunctionHandler(Person input, ILambdaContext context)
        {
            if (input == null)
            {
                throw new ArgumentNullException(nameof(input));
            }

            return input;
        }
    }
}
