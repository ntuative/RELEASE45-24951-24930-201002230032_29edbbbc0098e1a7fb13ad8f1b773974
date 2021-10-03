package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1671:Array;
      
      private var var_1672:String;
      
      private var var_1670:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1672 = param1;
         var_1671 = param2;
         var_1670 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1672;
      }
      
      public function get yieldList() : Array
      {
         return var_1671;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1670;
      }
   }
}
