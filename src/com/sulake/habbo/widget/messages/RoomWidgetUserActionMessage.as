package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_686:String = "RWUAM_RESPECT_USER";
      
      public static const const_705:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_625:String = "RWUAM_START_TRADING";
      
      public static const const_709:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_640:String = "RWUAM_WHISPER_USER";
      
      public static const const_619:String = "RWUAM_IGNORE_USER";
      
      public static const const_426:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_523:String = "RWUAM_BAN_USER";
      
      public static const const_622:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_376:String = "RWUAM_KICK_USER";
      
      public static const const_504:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_687:String = " RWUAM_RESPECT_PET";
      
      public static const const_344:String = "RWUAM_KICK_BOT";
      
      public static const const_1204:String = "RWUAM_TRAIN_PET";
      
      public static const const_527:String = "RWUAM_PICKUP_PET";
      
      public static const const_671:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_714:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
