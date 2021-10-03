package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1078:Array;
      
      private var var_1933:String;
      
      private var var_1934:String;
      
      private var var_1932:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         var_1078 = param1;
         var_1933 = param2;
         var_1934 = param3;
         var_1932 = param4;
      }
      
      public function get colours() : Array
      {
         return var_1078;
      }
      
      public function get backgroundAssetName() : String
      {
         return var_1933;
      }
      
      public function get colourAssetName() : String
      {
         return var_1934;
      }
      
      public function get chosenColourAssetName() : String
      {
         return var_1932;
      }
   }
}
