using UnityEngine;
using System.Collections;
using UnityEngine.UI; 

public class UpgradeBar : MonoBehaviour
{
	public Image bar = null;
    // Start is called before the first frame update
	public void Increment()
	{
		if (bar)
		{
			bar.fillAmount += 0.2f;
		}	
	}
}
