package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1348:String;
      
      private var var_1354:String;
      
      private var var_1039:String;
      
      private var var_407:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1348 = String(param1.@align);
         var_1039 = String(param1.@base);
         var_1354 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_407 = Number(_loc2_);
            if(var_407 > 1)
            {
               var_407 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1348;
      }
      
      public function get ink() : String
      {
         return var_1354;
      }
      
      public function get base() : String
      {
         return var_1039;
      }
      
      public function get isBlended() : Boolean
      {
         return var_407 != 1;
      }
      
      public function get blend() : Number
      {
         return var_407;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
