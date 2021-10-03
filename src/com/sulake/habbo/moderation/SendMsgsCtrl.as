package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModMessageMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class SendMsgsCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_1221:String;
      
      private var _disposed:Boolean;
      
      private var var_1461:String;
      
      private var var_1222:int;
      
      private var var_42:ModerationManager;
      
      private var var_810:IDropMenuWindow;
      
      private var var_389:ITextFieldWindow;
      
      private var var_46:IFrameWindow;
      
      private var var_289:Boolean = true;
      
      public function SendMsgsCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         var_42 = param1;
         var_1222 = param2;
         var_1461 = param3;
         var_1221 = param4;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_181)
         {
            return;
         }
         if(!var_289)
         {
            return;
         }
         var_389.text = "";
         var_289 = false;
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_46;
      }
      
      public function getId() : String
      {
         return var_1461;
      }
      
      private function onSendMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         if(var_289 || false)
         {
            var_42.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return;
         }
         var_42.connection.send(new ModMessageMessageComposer(var_1222,var_389.text,var_1221));
         this.dispose();
      }
      
      public function show() : void
      {
         var_46 = IFrameWindow(var_42.getXmlWindow("send_msgs"));
         var_46.caption = "Msg To: " + var_1461;
         var_46.findChildByName("send_message_but").procedure = onSendMessageButton;
         var_389 = ITextFieldWindow(var_46.findChildByName("message_input"));
         var_389.procedure = onInputClick;
         var_810 = IDropMenuWindow(var_46.findChildByName("msgTemplatesSelect"));
         prepareMsgSelect(var_810);
         var_810.procedure = onSelectTemplate;
         var _loc1_:IWindow = var_46.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_46.visible = true;
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + var_42.initMsg.messageTemplates.length);
         param1.populate(var_42.initMsg.messageTemplates);
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_46 != null)
         {
            var_46.destroy();
            var_46 = null;
         }
         var_810 = null;
         var_389 = null;
         var_42 = null;
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_36)
         {
            return;
         }
         var _loc3_:String = var_42.initMsg.messageTemplates["null"];
         if(_loc3_ != null)
         {
            var_289 = false;
            var_389.text = _loc3_;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1222;
      }
   }
}
