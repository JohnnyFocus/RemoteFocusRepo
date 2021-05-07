package com.example.finalattempt

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.fragment.app.Fragment
import com.example.finalattempt.fragments.AccountFragment
import com.example.finalattempt.fragments.HomeFragment
import com.example.finalattempt.fragments.OrderFragment
import com.google.android.material.bottomnavigation.BottomNavigationView

class BuckStop : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_buck_stop)

        val actionBar = supportActionBar

        actionBar!!.title = "Buck Stop"
        actionBar.setDisplayHomeAsUpEnabled(true)
        val homeFragment = HomeFragment()
        val accountFragment = AccountFragment()
        val orderFragment = OrderFragment()

        makeCurrentFragment(homeFragment)

        val bottomNav = findViewById<BottomNavigationView>(R.id.bottomNav)
        bottomNav.setOnNavigationItemSelectedListener {
            when(it.itemId) {
                R.id.home -> makeCurrentFragment(homeFragment)
                R.id.account -> makeCurrentFragment(accountFragment)
                R.id.order -> makeCurrentFragment(orderFragment)
            }
            true
        }
    }

    private fun makeCurrentFragment(fragment: Fragment) =
        supportFragmentManager.beginTransaction().apply {
            replace(R.id.fl_wrapper, fragment)
            commit()
        }
}