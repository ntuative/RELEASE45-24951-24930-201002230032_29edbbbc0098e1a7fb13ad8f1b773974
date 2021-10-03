package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_111:DisplayObject;
      
      private var var_2262:uint;
      
      private var var_747:IWindowToolTipAgentService;
      
      private var var_749:IWindowMouseScalingService;
      
      private var var_358:IWindowContext;
      
      private var var_748:IWindowFocusManagerService;
      
      private var var_751:IWindowMouseListenerService;
      
      private var var_750:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2262 = 0;
         var_111 = param2;
         var_358 = param1;
         var_750 = new WindowMouseDragger(param2);
         var_749 = new WindowMouseScaler(param2);
         var_751 = new WindowMouseListener(param2);
         var_748 = new FocusManager(param2);
         var_747 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_749;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_748;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_747;
      }
      
      public function dispose() : void
      {
         if(var_750 != null)
         {
            var_750.dispose();
            var_750 = null;
         }
         if(var_749 != null)
         {
            var_749.dispose();
            var_749 = null;
         }
         if(var_751 != null)
         {
            var_751.dispose();
            var_751 = null;
         }
         if(var_748 != null)
         {
            var_748.dispose();
            var_748 = null;
         }
         if(var_747 != null)
         {
            var_747.dispose();
            var_747 = null;
         }
         var_358 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_751;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_750;
      }
   }
}
