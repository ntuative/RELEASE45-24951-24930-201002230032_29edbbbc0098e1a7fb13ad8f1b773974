package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_785:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_785 = new Array();
         var_785.push(param1.length);
         var_785 = var_785.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_785;
      }
   }
}
