package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2064:int;
      
      private var var_2065:String;
      
      private var var_1617:int;
      
      private var _disposed:Boolean;
      
      private var var_2066:int;
      
      private var var_1858:String;
      
      private var var_1287:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1858 = param1.readString();
         var_2064 = param1.readInteger();
         var_1617 = param1.readInteger();
         var_2065 = param1.readString();
         var_2066 = param1.readInteger();
         var_1287 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_2066;
      }
      
      public function get worldId() : int
      {
         return var_1617;
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
      }
      
      public function get unitPropertySet() : String
      {
         return var_1858;
      }
      
      public function get unitPort() : int
      {
         return var_2064;
      }
      
      public function get castLibs() : String
      {
         return var_2065;
      }
      
      public function get nodeId() : int
      {
         return var_1287;
      }
   }
}
