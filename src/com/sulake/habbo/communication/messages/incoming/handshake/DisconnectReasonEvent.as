package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1363:String = "DisconnectReasonPeerConnectionLost";
      
      public static const const_970:String = "DisconnectReasonTimeout";
      
      public static const const_530:String = "DisconnectReasonDisconnected";
      
      public static const const_314:String = "DisconnectReasonBanned";
      
      public static const const_937:String = "DisconnectReasonLoggedOut";
      
      public static const const_914:String = "DisconnectReasonConcurrentLogin";
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : String
      {
         var _loc1_:int = (this.var_4 as DisconnectReasonParser).reason;
         switch(_loc1_)
         {
            case -1:
               return const_530;
            case 0:
               return const_530;
            case 1:
               return const_937;
            case 1009:
            case 2:
               return const_914;
            case 3:
               return const_970;
            case 4:
               return const_1363;
            default:
               return const_530;
         }
      }
   }
}
