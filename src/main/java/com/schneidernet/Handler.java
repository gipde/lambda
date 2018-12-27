package com.schneidernet;

public class Handler  {
        public Object handleRequest(Object request)  {
            return  String.format("Hello %s", request);
        }
}
