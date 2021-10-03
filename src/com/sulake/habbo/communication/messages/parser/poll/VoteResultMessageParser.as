package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1309:int;
      
      private var var_921:String;
      
      private var var_661:Array;
      
      private var var_934:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_661.slice();
      }
      
      public function flush() : Boolean
      {
         var_921 = "";
         var_934 = [];
         var_661 = [];
         var_1309 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1309;
      }
      
      public function get question() : String
      {
         return var_921;
      }
      
      public function get choices() : Array
      {
         return var_934.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_921 = param1.readString();
         var_934 = [];
         var_661 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_934.push(param1.readString());
            var_661.push(param1.readInteger());
            _loc3_++;
         }
         var_1309 = param1.readInteger();
         return true;
      }
   }
}
