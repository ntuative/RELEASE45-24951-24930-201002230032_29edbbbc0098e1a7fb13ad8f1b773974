package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LagWarningLogger
   {
      
      public static const const_923:int = 0;
      
      public static const WARNING_TYPE_CHAT_DELAY:int = 1;
       
      
      private var var_1255:Boolean = true;
      
      private var var_1317:int = 0;
      
      private var var_764:int = 0;
      
      private var var_1136:int = 0;
      
      private var var_765:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1318:int = 15;
      
      private var var_160:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      private var var_1319:int = 60;
      
      public function LagWarningLogger()
      {
         super();
         var_1136 = getTimer();
      }
      
      public function logWarnings() : void
      {
         if(!var_1255)
         {
            return;
         }
         if(nothingToReport)
         {
            return;
         }
         var _loc1_:LagWarningReportMessageComposer = new LagWarningReportMessageComposer(var_764,var_765);
         if(_connection != null)
         {
            _connection.send(_loc1_);
         }
         resetLog();
         ++var_1317;
      }
      
      private function get nothingToReport() : Boolean
      {
         return var_764 == 0 && var_765 == 0;
      }
      
      private function resetLog() : void
      {
         var_764 = 0;
         var_765 = 0;
      }
      
      public function update(param1:uint) : void
      {
         if(!var_1255)
         {
            return;
         }
         if(getTimer() - var_1136 > var_1319 * 1000 && var_1317 < var_1318)
         {
            var_1136 = getTimer();
            logWarnings();
         }
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_160 = param1;
         var_1319 = int(var_160.getKey("lagwarninglog.interval","60"));
         var_1318 = int(var_160.getKey("lagwarninglog.reportlimit","15"));
         var_1255 = Boolean(int(var_160.getKey("lagwarninglog.enabled","1")));
      }
      
      public function registerWarning(param1:int) : void
      {
         switch(param1)
         {
            case WARNING_TYPE_CHAT_DELAY:
               var_765 += 1;
            case const_923:
               var_764 += 1;
         }
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
