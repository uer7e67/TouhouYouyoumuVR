﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GrazeCollider : MonoBehaviour
{
    public GameObject digitDisplay;
    public int grazePoint;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void OnTriggerEnter(Collider collider) {
        var name = collider.name;
        GameObject obj = collider.gameObject;
        if(obj.tag == "Danmaku")
        {
            
            GameObject.Find("Player").GetComponentInChildren<AudioManager>().PlayGrazeSE(obj);
            digitDisplay.GetComponent<DigitDisplay>().displaynumber += grazePoint;
            Debug.Log("Graze " + name + " !");
        }
        //Debug.Log("on collide enter : " + name);
    }
}