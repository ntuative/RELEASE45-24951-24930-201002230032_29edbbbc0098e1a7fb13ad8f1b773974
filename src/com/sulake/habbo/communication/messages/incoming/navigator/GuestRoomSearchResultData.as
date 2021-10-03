package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomSearchResultData implements IDisposable, MsgWithRequestId
   {
       
      
      private var _searchType:int;
      
      private var _disposed:Boolean;
      
      private var var_1972:String;
      
      private var var_92:Array;
      
      public function GuestRoomSearchResultData(param1:IMessageDataWrapper)
      {
         var_92 = new Array();
         super();
         _searchType = param1.readInteger();
         var_1972 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_92.push(new GuestRoomData(param1));
            _loc3_++;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get searchType() : int
      {
         return _searchType;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_92 != null)
         {
            for each(_loc1_ in this.var_92)
            {
               _loc1_.dispose();
            }
         }
         this.var_92 = null;
      }
      
      public function get rooms() : Array
      {
         return var_92;
      }
      
      public function get searchParam() : String
      {
         return var_1972;
      }
   }
}
