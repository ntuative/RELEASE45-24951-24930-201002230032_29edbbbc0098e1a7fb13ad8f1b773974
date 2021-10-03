package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_665:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2032:BitmapData;
      
      private var var_2033:String;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_665,param3,param4);
         var_2033 = param1;
         var_2032 = param2;
      }
      
      public function get badgeImage() : BitmapData
      {
         return var_2032;
      }
      
      public function get badgeID() : String
      {
         return var_2033;
      }
   }
}
