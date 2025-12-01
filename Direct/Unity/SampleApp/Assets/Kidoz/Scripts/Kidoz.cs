using UnityEngine;
#if UNITY_4_6 || UNITY_5
using UnityEngine.EventSystems;
#endif
using System;
using System.Collections;

#if UNITY_IOS
using KIDOZiOSInterface;
#elif UNITY_ANDROID
using KIDOZAndroidInterface;
#else
using KIDOZDummyInterface;
#endif

namespace KidozSDK
{
	
	public class Kidoz :MonoBehaviour
	{

		public enum PANEL_TYPE
		{
			BOTTOM = 0, TOP = 1, LEFT = 2, RIGHT = 3
		};
		
		public enum HANDLE_POSITION
		{
			START, CENTER, END
		};
		
	public enum BANNER_POSITION
		{
			TOP_CENTER = 0,
			BOTTOM_CENTER = 1,
			TOP_LEFT = 2,
			TOP_RIGHT = 3,
			BOTTOM_LEFT = 4,
			BOTTOM_RIGHT = 5
		}
		
		public enum INTERSTITIAL_AD_MODE
		{
			NORMAL = 0,
			REWARDED = 1
		}

		interface IAdLoader{
			void LoadAd ();
		}

		class BannerAdLoader : IAdLoader{

			public bool isAutoShow = false;
			public BANNER_POSITION position = BANNER_POSITION.BOTTOM_CENTER;

			public BannerAdLoader (bool isAutoShow, BANNER_POSITION position) {
				this.isAutoShow = isAutoShow;
				this.position = position;
			}

			public void LoadAd (){
				kidozin.loadBanner (isAutoShow, (int)position);
			}
		}

		public static ArrayList adLoaderArray = new ArrayList ();

		public const int NO_GAME_OBJECT = -1;
		public const int PLATFORM_NOT_SUPPORTED = -2;

		public static event Action<string> initSuccess;
		
		public static event Action<string> initError;

		
		public static event Action<string> onBannerLoaded;
		
		public static event Action<string> onBannerFailedToLoad;

		public static event Action<string> onBannerShown;

		public static event Action<string> onBannerFailedToShow;

		public static event Action<string> onBannerImpression;

		public static event Action<string> onBannerClosed;


		public static event Action<string> onInterstitialLoaded;

		public static event Action<string> onInterstitialFailedToLoad;

		public static event Action<string> onInterstitialShown;

		public static event Action<string> onInterstitialFailedToShow;

		public static event Action<string> onInterstitialImpression;

		public static event Action<string> onInterstitialClosed;


		public static event Action<string> onRewardedLoaded;

		public static event Action<string> onRewardedFailedToLoad;

		public static event Action<string> onRewardedShown;

		public static event Action<string> onRewardedFailedToShow;

		public static event Action<string> onRewardedImpression;

		public static event Action<string> onRewardedReceived;

		public static event Action<string> onRewardedClosed;


		public string PublisherID;
		public string SecurityToken;
		
		static private bool initFlag = false;
		static private bool mPause = false;

		static private string PLUGIN_VERSION = "10.0.0";
		private static Kidoz instance;
		public static Kidoz Instance
		{
			get
			{
				return instance;
			}
		}

#if UNITY_IOS
		private static KIDOZiOSInterface.KIDOZiOSInterface kidozin = new KIDOZiOSInterface.KIDOZiOSInterface();
#elif UNITY_ANDROID
		private static KIDOZAndroidInterface.KIDOZAndroidInterface kidozin = new KIDOZAndroidInterface.KIDOZAndroidInterface();
#else
		private static KIDOZDummyInterface.KIDOZDummyInterface kidozin = new KIDOZDummyInterface.KIDOZDummyInterface ( );
#endif	
		
		
		public static void SetiOSAppPauseOnBackground(Boolean pause){
			mPause = pause;
		}

		public static void init (string developerID, string securityToken)
		{
			if (initFlag == true)
			{
				return;
			}
			initFlag = true;
			print ( "Kidoz | init:" + developerID + "," + securityToken /*+ "," + "-->" + instance.PublisherID + "," + instance.SecurityToken*/ );
			GameObject gameObject = new GameObject("KidozObject");
			instance = gameObject.AddComponent<Kidoz>();
			kidozin.init ( developerID, securityToken,PLUGIN_VERSION );
		}
		
		
		public static bool isInitialised ()
		{
			if (kidozin == null)
			{
				return false;
			}
			return kidozin.isInitialised ( );
		}

		public static string getSdkVersion() 
		{
			return kidozin.getSdkVersion();
		}

		//Basic function creation function.
		//Since Kidoz SDK should be activated only once use this function to create 
		//a game object. If Kidoz game object was added to the scene there is no need to call this function



		//***********************************//
		//***** INTERSTITIAL & REWARDED *****//
		//***********************************//
		// Description: Load interstitial add ---- this function is deprecated 
		// Parameters: 
		// 		
		// return:
		//		0 	- the function worked correctly
		//		NO_GAME_OBJECT	- there is no Kidoz gameobject 
		public static int loadInterstitialAd () {

			kidozin.loadInterstitialAd ();
			return 0;

		}
		
		public static int loadRewardedAd (){

			kidozin.loadRewardedAd ();
			return 0;

		}

		
		// Description: show the interstitial add that was loaded
		// Parameters: 
		// 		
		// return:
		//		0 	- the function worked correctly
		//		NO_GAME_OBJECT	- there is no Kidoz gameobject 
		public static int showInterstitial ()
		{
			kidozin.showInterstitial ( );
			return 0;
		}
		
		public static int showRewarded ()
		{
			kidozin.showRewarded ( );
			return 0;
		}
		
		// Description: return if an interstitial add was loaded
		// Parameters: 
		// 		
		// return:
		//		0 	- interstitial add was not loaded
		//		NO_GAME1_OBJECT	- there is no Kidoz gameobject 
		public static bool getIsInterstitialLoaded ()
		{
			return kidozin.getIsInterstitialLoaded ( );
			
		}
		
		public static bool getIsRewardedLoaded ()
		{
			return kidozin.getIsRewardedLoaded ( );
			
		}
		
		
		//******************//
		//***** BANNER *****//
		//******************//	
		
		
		// Description: add Banner to view 
		// Parameters: 
		// 		int - banner position
		// return:
		//		0 	- the function worked correctly
		//		NO_GAME_OBJECT	- there is no Kidoz gameobject 
		public static int loadBanner (bool isAutoShow, BANNER_POSITION position){

			kidozin.loadBanner (isAutoShow, (int)position);
			return 0;

		}
		
		// Description: set Banner Position 
		// Parameters: 
		// 		int - banner position
		// return:
		//		0 	- the function worked correctly
		//		NO_GAME_OBJECT	- there is no Kidoz gameobject 
		public static int setBannerPosition (BANNER_POSITION position)
		{
			kidozin.setBannerPosition ( (int) position );
			return 0;
		}
		
		
		// Description: show the banner 
		// Parameters: 
		// 		N/A
		// return:
		//		0 	- the function worked correctly
		//		NO_GAME_OBJECT	- there is no Kidoz gameobject 
		public static int showBanner ()
		{
			kidozin.showBanner ( );
			return 0;
		}
		
		// Description: hide the banner 
		// Parameters: 
		// 		N/A
		// return:
		//		0 	- the function worked correctly
		//		NO_GAME_OBJECT	- there is no Kidoz gameobject 
		public static int hideBanner ()
		{
			kidozin.hideBanner ( );
			return 0;
		}
		
		
		
		
		public static void printToastMessage (String message)
		{
			kidozin.logMessage ( message );
		}

		//***********************************//
		//***** SDK Init Callbacks            *****//
		//***********************************//

		public void initSuccessCallback (string message)
		{
			if (adLoaderArray.Count > 0) {

				for (int i = adLoaderArray.Count - 1; i >= 0; i--) {
					((IAdLoader)adLoaderArray [i]).LoadAd ();
					adLoaderArray.RemoveAt (i);
				}
			}

			if (initSuccess != null)
			{
				initSuccess ( message );
			}
		}

		public void initErrorCallback (string message)
		{
			if (initError != null)
			{
				initError ( message );
			}
		}

		//***********************************//
		//***** Banner Callbacks        *****//
		//***********************************//


		public void bannerLoadedCallBack (string message)
		{
			if (onBannerLoaded != null)
			{
				onBannerLoaded(message);
			}
		}

		public void bannerFailedToLoadCallBack(string message)
		{
			if (onBannerFailedToLoad != null)
			{
				onBannerFailedToLoad(message);
			}
		}

		public void bannerShownCallBack(string message)
		{
			if(onBannerShown != null)
            {
				onBannerShown(message);
			}
		}

		public void bannerFailedToShowCallBack(string message)
		{
			if (onBannerFailedToShow != null)
			{
				onBannerFailedToShow(message);
			}
		}

		public void bannerImpressionCallBack(string message)
        {
			if(onBannerImpression != null)
            {
				onBannerImpression(message);
			}
        }


		public void bannerClosedCallBack(string message)
		{
			if (onBannerClosed != null)
			{
				onBannerClosed(message);
			}
		}

		//***********************************//
		//***** INTERSTITIAL Callbacks  *****//
		//***********************************//

		public void interstitialLoadedCallBack(string message)
		{
			if (onInterstitialLoaded != null)
			{
				onInterstitialLoaded(message);
			}
		}

		public void interstitialFailedToLoadCallBack(string message)
		{
			if (onInterstitialFailedToLoad != null)
			{
				onInterstitialFailedToLoad(message);
			}
		}

		public void interstitialShownCallBack (string message)
		{
			
			#if UNITY_IOS
			if(mPause){
				Time.timeScale = 0;
				AudioListener.pause = true;
			}
			#endif
			
			if (onInterstitialShown != null)
			{
				onInterstitialShown(message);
			}
		}

		public void interstitialFailedToShowCallBack(string message)
		{
			if(onInterstitialFailedToShow != null)
            {
				onInterstitialFailedToShow(message);
			}
		}

		public void interstitialImpressionCallBack(string message)
		{
			if(onInterstitialImpression != null)
            {
				onInterstitialImpression(message);

			}
		}

		public void interstitialClosedCallBack (string message)
		{
			#if UNITY_IOS
			if(mPause){
				Time.timeScale = 1;
				AudioListener.pause = false;
			}
			#endif
			
			if (onInterstitialClosed != null)
			{
				onInterstitialClosed(message);
			}
		}

		//***********************************//
		//***** REWARDED Callbacks      *****//
		//***********************************//

		public void rewardedLoadedCallBack(string message)
		{
			if (onRewardedLoaded != null)
			{
				onRewardedLoaded(message);
			}
		}

		public void rewardedFailedToLoadCallBack(string message)
		{
			if (onRewardedFailedToLoad != null)
			{
				onRewardedFailedToLoad(message);
			}
		}

		public void rewardedShownCallBack(string message)
		{

#if UNITY_IOS
			if(mPause){
				Time.timeScale = 0;
				AudioListener.pause = true;
			}
#endif

			if (onRewardedShown != null)
			{
				onRewardedShown(message);
			}
		}

		public void rewardedFailedToShowCallBack(string message)
		{
            if (onRewardedFailedToShow != null)
            {
				onRewardedFailedToShow(message);
			}
		}

		public void rewardedImpressionCallBack(string message)
		{
			if(onRewardedImpression != null)
            {
				onRewardedImpression(message);
			}
		}

		public void rewardedReceivedCallBack (string message)
		{
			if (onRewardedReceived != null)
			{
				onRewardedReceived(message);
			}
		}	
				
		public void rewardedClosedCallBack (string message)
		{
			
			#if UNITY_IOS
			if(mPause){
				Time.timeScale = 1;
				AudioListener.pause = false;
			}
			#endif
			
			if (onRewardedClosed != null)
			{
				onRewardedClosed(message);
			}
		}

	}

}
