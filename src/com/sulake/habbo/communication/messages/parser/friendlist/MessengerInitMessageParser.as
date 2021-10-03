package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2297:int;
      
      private var var_2298:int;
      
      private var var_2299:int;
      
      private var var_201:Array;
      
      private var var_2295:int;
      
      private var var_2296:int;
      
      private var var_309:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_309 = new Array();
         this.var_201 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2297;
      }
      
      public function get friends() : Array
      {
         return this.var_201;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2299;
      }
      
      public function get categories() : Array
      {
         return this.var_309;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2298;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2296;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2296 = param1.readInteger();
         this.var_2299 = param1.readInteger();
         this.var_2297 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_309.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_201.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2298 = param1.readInteger();
         this.var_2295 = param1.readInteger();
         return true;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2295;
      }
   }
}
