using UnityEngine;

public class EnemyAI : MonoBehaviour
{
    public Transform player;
    public float speed;
    public float contactRadius = 1.5f; // Distance at which the enemy will make contact with the player
    public float avoidanceRadius = 2f; // Distance at which the enemy will avoid the player
    public float avoidanceTime = 2f; // Time the enemy will avoid the player before returning to normal behavior

    private Rigidbody2D rb;

    private bool isAvoidingPlayer = false;
    private float avoidanceTimer = 0f;

    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
    }

    void Update()
    {
        // Check if the player is within contact radius
        if (Vector2.Distance(transform.position, player.position) <= contactRadius)
        {
            // Move towards the player
            Vector2 direction = (player.position - transform.position).normalized;
            rb.velocity = direction * speed;
        }
        else if (isAvoidingPlayer) 
        {
            // Avoid the player for a set amount of time before returning to normal behavior
            avoidanceTimer -= Time.deltaTime;
            if (avoidanceTimer <= 0f) 
            {
                isAvoidingPlayer = false;
            }
            else 
            {
                // Move away from the player
                Vector2 direction = (transform.position - player.position).normalized;
                rb.velocity = direction * speed;
            }
        } 
        else 
        {
            // Move towards the player, but occasionally move away
            if (Random.value < 0.95f) // 95% chance of moving towards player
            {
                Vector2 direction = (player.position - transform.position).normalized;
                rb.velocity = direction * speed;
            } 
            else // 5% chance of moving away from player
            {
                Vector2 direction = (transform.position - player.position).normalized;
                rb.velocity = direction * speed;

                // Start avoiding the player for a set amount of time
                isAvoidingPlayer = true;
                avoidanceTimer = avoidanceTime;
            }
        }
    }
}
