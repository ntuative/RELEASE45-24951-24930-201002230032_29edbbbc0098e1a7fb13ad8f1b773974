package com.sulake.habbo.communication.messages.outgoing.users
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ScrGetUserInfoMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_24:Array;
      
      public function ScrGetUserInfoMessageComposer(param1:String)
      {
         var_24 = new Array();
         super();
         this.var_24.push(param1);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return this.var_24;
      }
      
      public function dispose() : void
      {
         this.var_24 = null;
      }
   }
}
