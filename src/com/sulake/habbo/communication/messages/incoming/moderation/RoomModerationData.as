package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_109:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1576:int;
      
      private var var_405:int;
      
      private var var_605:RoomData;
      
      private var var_1912:int;
      
      private var _ownerName:String;
      
      private var var_2114:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_405 = param1.readInteger();
         var_1576 = param1.readInteger();
         var_2114 = param1.readBoolean();
         var_1912 = param1.readInteger();
         _ownerName = param1.readString();
         var_109 = new RoomData(param1);
         var_605 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_1576;
      }
      
      public function get event() : RoomData
      {
         return var_605;
      }
      
      public function get room() : RoomData
      {
         return var_109;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_109 != null)
         {
            var_109.dispose();
            var_109 = null;
         }
         if(var_605 != null)
         {
            var_605.dispose();
            var_605 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_405;
      }
      
      public function get ownerId() : int
      {
         return var_1912;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_2114;
      }
   }
}
