package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const CATALOG_CLUB:String = "RWOCM_CLUB_MAIN";
      
      public static const const_704:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1920:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_704);
         var_1920 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1920;
      }
   }
}
