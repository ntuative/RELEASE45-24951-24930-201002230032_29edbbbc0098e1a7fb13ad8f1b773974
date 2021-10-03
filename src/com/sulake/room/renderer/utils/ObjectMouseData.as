package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_1853:String = "";
      
      private var var_138:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_1853 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_138 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_1853;
      }
      
      public function get objectId() : String
      {
         return var_138;
      }
   }
}
