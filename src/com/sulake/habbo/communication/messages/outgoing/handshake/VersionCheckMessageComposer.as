package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1630:String;
      
      private var var_1208:String;
      
      private var var_1629:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1629 = param1;
         var_1208 = param2;
         var_1630 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1629,var_1208,var_1630];
      }
      
      public function dispose() : void
      {
      }
   }
}
