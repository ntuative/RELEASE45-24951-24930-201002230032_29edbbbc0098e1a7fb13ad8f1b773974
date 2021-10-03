package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_639:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_639 = new ByteArray();
         var_639.writeShort(param1);
         var_639.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_639.position = 0;
         if(false)
         {
            _loc1_ = var_639.readShort();
            var_639.position = 0;
         }
         return _loc1_;
      }
   }
}
