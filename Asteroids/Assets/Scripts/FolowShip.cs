using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FolowShip : MonoBehaviour
{
    public GameObject Ship = null;
    private int shield;
    private Vector3 offset;

    void Start()
    {
      offset = new Vector3(0, 0.16f, 0);

      shield = PlayerPrefs.GetInt("shield");
      if (shield == 0)
        Destroy(gameObject);
    }

    // Update is called once per frame
    void Update()
    {
      if (shield > 0 && gameObject != null && Ship != null)
        gameObject.transform.position = Ship.transform.position + offset;
    }
}
