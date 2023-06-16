 using UnityEngine;

public class EnemyAI : MonoBehaviour
{
    public Transform player;
    public float speed;

    private Rigidbody2D rb;

    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
    }

    void Update()
    {
        Vector2 direction = (player.position - transform.position).normalized;
        rb.velocity = direction * speed;
    }
}