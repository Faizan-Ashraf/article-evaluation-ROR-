admin = User.create!(
  email: 'admin@example.com',
  username: 'admin',
  password: 'password',
  password_confirmation: 'password',
  role: 'admin'
)

competitor = User.create!(
  email: 'competitor@example.com',
  username: 'competitor',
  password: 'password',
  password_confirmation: 'password',
  role: 'competitor'
)

comp1 = Competition.create!(
  title: 'First Writing Contest',
  description: 'Write a story about your favorite place.',
  evaluation_criteria: 'Creativity, grammar, originality',
  created_by_id: admin,
  created_at: Time.current,
  is_active: true
)

comp2 = Competition.create!(
  title: 'Tech Article Challenge',
  description: 'Write an article about the future of AI.',
  evaluation_criteria: 'Technical accuracy, clarity, insight',
  created_by_id: admin,
  created_at: Time.current,
  is_active: true
)

sub1 = Submission.create!(
  content: 'Once upon a time...',
  competitor: competitor,
  competition: comp1,
  created_at: Time.current,
  status: :pending
)

sub2 = Submission.create!(
  content: 'Artificial intelligence is evolving rapidly...',
  competitor: competitor,
  competition: comp2,
  created_at: Time.current,
  status: :pending
)