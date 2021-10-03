package com.sulake.core.communication.messages
{
   import com.sulake.core.communication.connection.IConnection;
   
   public class MessageEvent implements IMessageEvent
   {
       
      
      private var _parserClass:Class;
      
      protected var var_171:Function;
      
      protected var _connection:IConnection;
      
      protected var var_4:IMessageParser;
      
      public function MessageEvent(param1:Function, param2:Class)
      {
         super();
         var_171 = param1;
         _parserClass = param2;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get callback() : Function
      {
         return var_171;
      }
      
      public function dispose() : void
      {
         var_171 = null;
         _parserClass = null;
         _connection = null;
         var_4 = null;
      }
      
      public function get connection() : IConnection
      {
         return _connection;
      }
      
      public function set parser(param1:IMessageParser) : void
      {
         var_4 = param1;
      }
      
      public function get parserClass() : Class
      {
         return _parserClass;
      }
   }
}
