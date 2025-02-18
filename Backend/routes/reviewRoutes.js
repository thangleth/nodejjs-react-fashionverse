const express = require('express');
const reviewController = require('../controllers/reviewController');
const authenticateToken = require('../middleware/index');
const router = express.Router();

router.post('/', reviewController.createReview);
router.get('/', reviewController.getAllReviews);
router.get('/:id', reviewController.getReviewById);
router.put('/updatereview/:id', reviewController.updateReview);
router.delete('/:id', authenticateToken, reviewController.deleteReview);
router.delete('/deletereview/:id',  reviewController.cookReview);





module.exports = router;
