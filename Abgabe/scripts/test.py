import pandas as pd
from sqlalchemy import create_engine, text

engine = create_engine('postgresql+psycopg2://user:secret@localhost:5432/lf8_lets_meet_db')


# Step 1: Pick 3 random users
user_ids = pd.read_sql("SELECT id FROM public.user ORDER BY RANDOM() LIMIT 3;", engine)['id'].tolist()

# Step 2: Fetch all related info for these users
user_info = pd.read_sql(f"SELECT * FROM public.user WHERE id IN ({','.join(map(str, user_ids))});", engine)
messages = pd.read_sql(f"SELECT * FROM public.message WHERE sender_user_id IN ({','.join(map(str, user_ids))}) OR receiver_user_id IN ({','.join(map(str, user_ids))});", engine)
profile_likes = pd.read_sql(f"SELECT * FROM public.profile_like WHERE user_id IN ({','.join(map(str, user_ids))}) OR liked_user_id IN ({','.join(map(str, user_ids))});", engine)
user_hobbies = pd.read_sql(f"SELECT * FROM public.user_hobby WHERE user_id IN ({','.join(map(str, user_ids))});", engine)
friendships = pd.read_sql(
    f"SELECT * FROM public.friendship WHERE user_id IN ({','.join(map(str, user_ids))}) OR friend_user_id IN ({','.join(map(str, user_ids))});",
    engine
)
additional_resources = pd.read_sql(f"SELECT * FROM public.additional_recources WHERE user_id IN ({','.join(map(str, user_ids))});", engine)

# Step 3: Print the results
print("Users:\n", user_info)
print("Messages:\n", messages)
print("Profile Likes:\n", profile_likes)
print("User Hobbies:\n", user_hobbies)
print("Friendships:\n", friendships)
print("Additional Resources:\n", additional_resources)