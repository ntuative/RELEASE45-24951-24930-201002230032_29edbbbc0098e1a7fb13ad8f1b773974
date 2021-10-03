package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1520:int = 9;
      
      public static const const_1553:int = 4;
      
      public static const const_1478:int = 1;
      
      public static const const_1275:int = 10;
      
      public static const const_1429:int = 2;
      
      public static const const_1109:int = 7;
      
      public static const const_1284:int = 11;
      
      public static const const_1570:int = 3;
      
      public static const const_1245:int = 8;
      
      public static const const_1272:int = 5;
      
      public static const const_1421:int = 6;
      
      public static const const_1322:int = 12;
       
      
      private var var_1762:String;
      
      private var _roomId:int;
      
      private var var_1081:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1762;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1081 = param1.readInteger();
         var_1762 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1081;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
