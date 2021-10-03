package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2082:Class;
      
      private var var_2081:Class;
      
      private var var_2080:String;
      
      private var var_1262:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2080 = param1;
         var_2081 = param2;
         var_2082 = param3;
         if(rest == null)
         {
            var_1262 = new Array();
         }
         else
         {
            var_1262 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2082;
      }
      
      public function get assetClass() : Class
      {
         return var_2081;
      }
      
      public function get mimeType() : String
      {
         return var_2080;
      }
      
      public function get fileTypes() : Array
      {
         return var_1262;
      }
   }
}
