package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1766:String;
      
      private var var_405:int;
      
      private var var_1770:String;
      
      private var var_1767:String;
      
      private var var_1771:int;
      
      private var var_1769:String;
      
      private var var_1768:int;
      
      private var var_589:Array;
      
      private var var_1001:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_589 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1001 = false;
            return;
         }
         this.var_1001 = true;
         var_1771 = int(_loc2_);
         var_1770 = param1.readString();
         var_405 = int(param1.readString());
         var_1768 = param1.readInteger();
         var_1766 = param1.readString();
         var_1767 = param1.readString();
         var_1769 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_589.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_1768;
      }
      
      public function get eventName() : String
      {
         return var_1766;
      }
      
      public function get eventDescription() : String
      {
         return var_1767;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_1770;
      }
      
      public function get tags() : Array
      {
         return var_589;
      }
      
      public function get creationTime() : String
      {
         return var_1769;
      }
      
      public function get exists() : Boolean
      {
         return var_1001;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_1771;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_589 = null;
      }
      
      public function get flatId() : int
      {
         return var_405;
      }
   }
}
