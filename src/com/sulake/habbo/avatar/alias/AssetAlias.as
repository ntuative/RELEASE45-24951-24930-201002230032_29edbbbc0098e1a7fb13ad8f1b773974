package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_918:Boolean;
      
      private var _name:String;
      
      private var var_1691:String;
      
      private var var_919:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_1691 = String(param1.@link);
         var_919 = Boolean(parseInt(param1.@fliph));
         var_918 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_919;
      }
      
      public function get flipV() : Boolean
      {
         return var_918;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_1691;
      }
   }
}
