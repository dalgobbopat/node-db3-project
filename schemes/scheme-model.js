const db = require('../data/db-config.js');

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove
}

function find() {
 return db('schemes')
}

function findById(id) {
 return db('schemes').where({ id }).first();
}

function findSteps(id) {
 return db('schemes as sc')
    .join('steps as s', 's.scheme_id', '=', 'sc.id')
    .select('sc.scheme_name', 's.step_number', 's.instructions')
    .where('sc.id', '=', id)
    .orderBy('s.step_number')
}

function add(data) {
    return db('schemes')
        .insert(data)
        .then(ids => {
            return findById(ids[0]);
        })
}

function addStep(stepData, scheme_id) {
    return db('steps')
    .insert({...stepData, scheme_id})
    .then(([ id ]) => {
        return db('steps').where({id});
    })
}

function update(changes, id) {
    return db('schemes')
        .where({ id })
        .update(changes)
        .then(success => {
            if(success) {
                return findById(id)
            } else {
                return resizeBy.status(500).json({ message: 'Failed to update scheme'})
            }
        }) 
}

function remove(id) {
    return db('schemes').where({ id }).del();
}